SSH_AUTH_SOCK="/run/user/$(id --user)/ssh_agent.sock"

_ssh_agent_pid_path="/run/user/$(id --user)/ssh_agent.pid"

python -u - << EOF
import os, sys

pid = ""
if os.path.exists("${_ssh_agent_pid_path}"):
    pid = open("${_ssh_agent_pid_path}").read().strip()

if pid:
    path = os.path.normpath("/proc/%s/comm" % pid)
    cmd = open(path).read().strip() if os.path.exists(path) else ""
    if cmd == "ssh-agent":
        sys.exit(0)

sys.exit(1)
EOF

if [ "$?" -eq 0 ]; then
  echo "Active ssh agent detected with pid: $(cat "${_ssh_agent_pid_path}")"
else
  rm -- "${SSH_AUTH_SOCK}" > /dev/null 2>&1
  eval -- "$(ssh-agent -a "${SSH_AUTH_SOCK}")"

  if [ "$?" -eq 0 ]; then
    echo "${SSH_AGENT_PID}" > "${_ssh_agent_pid_path}"
    echo "New ssh agent started with pid: ${SSH_AGENT_PID}"
  else
    echo "Failed to start the ssh agent."
  fi
fi
