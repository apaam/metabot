# mb - MetaBot API CLI bash completion
# Source this file: source /path/to/mb.bash

_mb_complete() {
    local cur prev words cword
    _init_completion || return

    local commands="bots bot talk task schedule voice peers stats metrics health update"
    local schedule_cmds="list add cron pause resume cancel"
    local voice_cmds="call transcript list config tts"

    # First level completion
    if [[ $cword -eq 1 ]]; then
        COMPREPLY=($(compgen -W "$commands" -- "$cur"))
        return
    fi

    local cmd="${words[1]}"
    local subcmd=""
    [[ $cword -ge 3 ]] && subcmd="${words[2]}"

    case "$cmd" in
        schedule|sched|sc)
            if [[ $cword -eq 2 ]]; then
                COMPREPLY=($(compgen -W "$schedule_cmds" -- "$cur"))
            fi
            ;;
        voice|v)
            if [[ $cword -eq 2 ]]; then
                COMPREPLY=($(compgen -W "$voice_cmds" -- "$cur"))
            elif [[ "$subcmd" == "call" || "$subcmd" == "c" ]]; then
                if [[ "$prev" == "-w" || "$prev" == "--welcome" ]]; then
                    COMPREPLY=()
                else
                    COMPREPLY=($(compgen -W "-w --welcome" -- "$cur"))
                fi
            elif [[ "$subcmd" == "tts" ]]; then
                case "$prev" in
                    --provider|-p)
                        COMPREPLY=($(compgen -W "doubao openai elevenlabs" -- "$cur"))
                        ;;
                    -o|--output)
                        _filedir mp3
                        ;;
                    --voice)
                        COMPREPLY=()
                        ;;
                    *)
                        COMPREPLY=($(compgen -W "--provider -p --voice -o --output --play" -- "$cur"))
                        ;;
                esac
            fi
            ;;
        talk|t|task)
            # Bot name completion - could be enhanced to query API
            COMPREPLY=()
            ;;
        bot)
            # Bot name completion
            COMPREPLY=()
            ;;
    esac
}

complete -F _mb_complete mb
