# mm - MetaMemory CLI bash completion
# Source this file: source /path/to/mm.bash

_mm_complete() {
    local cur prev words cword
    _init_completion || return

    local commands="search s get g path p list ls folders f create c update u mkdir md delete rm health h"

    if [[ $cword -eq 1 ]]; then
        COMPREPLY=($(compgen -W "$commands" -- "$cur"))
        return
    fi

    local cmd="${words[1]}"

    case "$cmd" in
        create|c|update|u)
            case "$prev" in
                --folder|-f)
                    # Folder ID completion
                    COMPREPLY=()
                    ;;
                --tags|-t)
                    COMPREPLY=()
                    ;;
                --by|-b)
                    COMPREPLY=()
                    ;;
                *)
                    COMPREPLY=($(compgen -W "--folder -f --tags -t --by -b" -- "$cur"))
                    ;;
            esac
            ;;
        mkdir|md)
            # Parent folder ID completion (optional second arg)
            if [[ $cword -eq 3 ]]; then
                COMPREPLY=()
            fi
            ;;
        list|ls)
            # Folder ID completion (optional)
            COMPREPLY=()
            ;;
    esac
}

complete -F _mm_complete mm
