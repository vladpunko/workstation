_ssh_agent_available() {
  if command ssh-add -l > /dev/null 2>&1
  then
    return 0
  else
    # Reuse the agent even when no keys are loaded.
    [[ "$?" -eq 1 ]]
  fi
}

# Reuse the session agent to keep SSH forwarding working.
if _ssh_agent_available
then
  return 0
fi

# Share the desktop agent between terminal sessions.
if [[ -S "${XDG_RUNTIME_DIR}/gcr/ssh" ]]
then
  export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gcr/ssh"

  if _ssh_agent_available
  then
    return 0
  fi
fi

# Reuse a standalone agent when the desktop agent is unavailable.
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh_agent.sock"

# Prevent simultaneous shells from starting separate agents.
zmodload zsh/system
command touch -- "${XDG_RUNTIME_DIR}/ssh_agent.lock"

if ! zsystem flock -f ssh_agent_lock_descriptor "${XDG_RUNTIME_DIR}/ssh_agent.lock"
then
  return 1
fi

{
  # Another shell may have started an agent while this shell waited.
  if _ssh_agent_available
  then
    return 0
  fi

  command rm -f -- "${SSH_AUTH_SOCK}"

  # Keep loaded keys available across SSH connections.
  if ssh_agent_environment="$(command ssh-agent -s -a "${SSH_AUTH_SOCK}")"
  then
    eval -- "${ssh_agent_environment}" > /dev/null
  else
    return 1
  fi
} always {
  # Let other shells continue even if agent startup fails.
  zsystem flock -u "${ssh_agent_lock_descriptor}"
  unset ssh_agent_lock_descriptor ssh_agent_environment
}
