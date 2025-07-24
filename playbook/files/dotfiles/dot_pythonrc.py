import os
import readline

os.environ["PYTHON_HISTORY"] = os.devnull  # 3.13 or newer
os.environ["PYTHONHISTFILE"] = os.devnull

readline.set_history_length(0)
# ---
readline.write_history_file = lambda *args, **kwargs: None
