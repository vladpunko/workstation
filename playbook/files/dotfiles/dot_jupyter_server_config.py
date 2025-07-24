# -*- coding: utf-8 -*-

import os
import secrets

# Get the current program settings.
c = get_config()

# Set the main jupyter server address on the current machine.
c.ServerApp.ip = "127.0.0.1"

# Prevent existing browsers from automatic opening.
c.ServerApp.open_browser = False

# Set the preferred password to use for unattended access to the working jupyter server on the current machine.
c.ServerApp.password = "argon2:$argon2id$v=19$m=10240,t=10,p=8$sFMvtDQ1KbSg9XBQvcOknw$LAQU853X3Yf5Yptkx8lIlqJiV1VhkKvMDVA8pdM4pnk"

# Generate a random authorization token string.
c.ServerApp.token = secrets.token_hex()

# Set the main jupyter server port on the current machine.
c.ServerApp.port = 8050

# Set the preferred system path to use for the working jupyter server on the current machine.
c.ServerApp.root_dir = os.path.join(os.path.expanduser("~"), "Documents")
