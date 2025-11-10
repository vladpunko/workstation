SSH_AUTH_SOCK="/run/user/$(id --user)/ssh_agent.sock"

SSH_AGENT_PID_FILE="/run/user/$(id --user)/ssh_agent.pid"
if python3 -u - << EOF
import os, sys

pid = ""
if os.path.exists("${SSH_AGENT_PID_FILE}"):
    pid = open("${SSH_AGENT_PID_FILE}").read().strip()

if pid:
    path = os.path.normpath("/proc/%s/comm" % pid)
    cmd = open(path).read().strip() if os.path.exists(path) else ""
    if cmd == "ssh-agent":
        sys.exit(0)

sys.exit(1)
EOF
then
  echo "Active SSH authentication agent found with PID: $(cat "${SSH_AGENT_PID_FILE}")"
else
  command rm -- "${SSH_AUTH_SOCK}" > /dev/null 2>&1

  if eval -- "$(ssh-agent -a "${SSH_AUTH_SOCK}")"
  then
    echo "${SSH_AGENT_PID}" > "${SSH_AGENT_PID_FILE}"
    echo "SSH agent started and running under PID: ${SSH_AGENT_PID}"
  else
    echo "Could not launch new SSH agent."
  fi
fi
export SSH_AGENT_PID_FILE

export SSH_AUTH_SOCK
