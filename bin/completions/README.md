# Shell Completion Scripts

This directory contains shell completion scripts for the CLI tools.

## Available Completions

| Command      | Bash                     | Zsh                       |
|--------------|--------------------------|---------------------------|
| `mb`         | `mb.bash`                | `_mb`                     |
| `mm`         | `mm.bash`                | `_mm`                     |
| `metabot`    | `metabot.bash`           | `_metabot`                |
| `doubao-tts` | `doubao-tts.bash`        | `_doubao-tts`             |

## Installation

### Bash

**Temporary (current session only):**
```bash
source /path/to/metabot/bin/completions/mb.bash
source /path/to/metabot/bin/completions/mm.bash
source /path/to/metabot/bin/completions/metabot.bash
source /path/to/metabot/bin/completions/doubao-tts.bash
```

**Permanent (add to `~/.bashrc`):**
```bash
# For bash-completion package
for cmd in mb mm metabot doubao-tts; do
  [ -f "$HOME/metabot/bin/completions/${cmd}.bash" ] && source "$HOME/metabot/bin/completions/${cmd}.bash"
done
```

Or copy to system completion directory:
```bash
# System-wide (requires sudo)
sudo cp bin/completions/*.bash /etc/bash_completion.d/

# User-local (if bash-completion is installed)
cp bin/completions/*.bash ~/.local/share/bash-completion/completions/
```

### Zsh

**Temporary (current session only):**
```zsh
# Add to fpath and load
fpath+=(/path/to/metabot/bin/completions)
autoload -U compinit && compinit
```

**Permanent:**

1. Copy completions to a directory in your fpath:
```zsh
mkdir -p ~/.zsh/completions
cp /path/to/metabot/bin/completions/_* ~/.zsh/completions/
```

2. Add to `~/.zshrc` (if not already present):
```zsh
fpath+=(~/.zsh/completions)
autoload -U compinit && compinit
```

Or use Oh My Zsh custom completions:
```zsh
cp bin/completions/_* ~/.oh-my-zsh/completions/
```

## Completion Features

### mb
- Main commands: `bots`, `bot`, `talk`, `task`, `schedule`, `voice`, `peers`, `stats`, `metrics`, `health`, `update`
- Subcommands for `schedule`: `list`, `add`, `cron`, `pause`, `resume`, `cancel`
- Subcommands for `voice`: `call`, `transcript`, `list`, `config`, `tts`
- Options for voice commands: `--provider`, `--voice`, `-o`, `--output`, `--play`, `-w`, `--welcome`

### mm
- Commands: `search`, `get`, `path`, `list`, `folders`, `create`, `update`, `mkdir`, `delete`, `health`
- Options for `create`/`update`: `--folder`, `--tags`, `--by`, `--title`

### metabot
- Commands: `update`, `start`, `stop`, `restart`, `logs`, `status`

### doubao-tts
- Options: `-o`, `--output`, `-v`, `--voice`, `-f`, `--file`, `--speed`, `--volume`, `--pitch`, `--format`
- Voice suggestions: All available Chinese male/female voices
- Format suggestions: `mp3`, `wav`
