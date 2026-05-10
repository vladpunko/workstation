import os
import readline

os.environ["PYTHON_HISTORY"] = os.devnull  # 3.13 or newer
os.environ["PYTHONHISTFILE"] = os.devnull

readline.set_history_length(0)


def _disable_history_file(*_args, **_kwargs):
    return None


# `readline` still tries to flush history at interpreter shutdown, so replace
# that hook explicitly after disabling the history file locations.
readline.write_history_file = _disable_history_file
