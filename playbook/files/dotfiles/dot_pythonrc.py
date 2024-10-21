import os
import readline

os.environ["PYTHONHISTFILE"] = "/dev/null"

readline.set_history_length(0)
readline.write_history_file = lambda *args, **kwargs: None
