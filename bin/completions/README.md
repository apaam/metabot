# Shell Completion Scripts

This directory contains shell completion scripts for the CLI tools.

**Install layout:** `install.sh` / `metabot update` / `npm run update-cli` copy completions next to the binaries under **`~/.local/bin/completions/`** (bash: `mb`, `mm`, … from `*.bash`; zsh: `_mb`, `_mm`, …). `uninstall.sh` removes the same files. The installer **does not** edit `~/.bashrc` or `~/.zshrc`; copy the snippets from the end of `install.sh` output (or below) into your own config.

## Available Completions

| Command      | Bash                     | Zsh                       |
|--------------|--------------------------|---------------------------|
| `mb`         | `mb.bash` → `~/.../mb`   | `_mb`                     |
| `mm`         | `mm.bash` → `~/.../mm`   | `_mm`                     |
| `metabot`    | `metabot.bash`           | `_metabot`                |
| `doubao-tts` | `doubao-tts.bash`       | `_doubao-tts`             |

## Installation

### Files on disk

- **Full install / upgrade:** `install.sh`, `metabot update`, `mb … update`, or `npm run update-cli` refresh `~/.local/bin/completions/`.

### Bash

Source every file in `~/.local/bin/completions` whose name does **not** start with `_` (zsh `_*` files are skipped):

**Manual (one session):**

```bash
for f in ~/.local/bin/completions/*; do
  [ -f "$f" ] || continue
  case "$(basename "$f")" in _*) continue ;; esac
  # shellcheck source=/dev/null
  . "$f"
done
```

### Zsh

Add to `~/.zshrc` (put `fpath+=` **before** `compinit` if you use Oh My Zsh or similar):

```zsh
fpath+=("$HOME/.local/bin/completions")
autoload -Uz compinit && compinit
```

### Legacy path

Older installs used `~/.local/share/bash-completion/completions/`. `uninstall.sh` removes `mb`, `mm`, `metabot`, `doubao-tts` there if still present.

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
