# metabot - MetaBot management CLI bash completion
# Source this file: source /path/to/metabot.bash

_metabot_complete() {
    local cur prev words cword
    _init_completion || return

    local commands="update up start stop restart rs logs log status st"

    if [[ $cword -eq 1 ]]; then
        COMPREPLY=($(compgen -W "$commands" -- "$cur"))
        return
    fi

    local cmd="${words[1]}"

    case "$cmd" in
        logs|log)
            # Pass through to pm2 logs completion
            COMPREPLY=($(compgen -W "-n -f --lines --format" -- "$cur"))
            ;;
    esac
}

complete -F _metabot_complete metabot
