# doubao-tts - Volcengine Doubao TTS CLI bash completion
# Source this file: source /path/to/doubao-tts.bash

_doubao_tts_complete() {
    local cur prev words cword
    _init_completion || return

    local options="-o --output -v --voice -f --file --speed --volume --pitch --format -h --help"
    local voices_zh="zh_female_sajiaonvyou_moon_bigtts zh_female_gaolengyujie_moon_bigtts zh_female_tianmeixiaoyuan_moon_bigtts zh_female_yuanqinvyou_moon_bigtts zh_female_wanwanxiaohe_moon_bigtts zh_female_linjianvhai_moon_bigtts"
    local voices_zh_male="zh_male_aojiaobazong_moon_bigtts zh_male_jingqiangkanye_moon_bigtts zh_male_wennuanahu_moon_bigtts zh_male_yangguangqingnian_moon_bigtts"
    local formats="mp3 wav"

    case "$prev" in
        -o|--output)
            _filedir
            return
            ;;
        -v|--voice)
            COMPREPLY=($(compgen -W "$voices_zh $voices_zh_male" -- "$cur"))
            return
            ;;
        -f|--file)
            _filedir txt
            return
            ;;
        --speed|--volume|--pitch)
            # Numeric values
            COMPREPLY=()
            return
            ;;
        --format)
            COMPREPLY=($(compgen -W "$formats" -- "$cur"))
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        COMPREPLY=($(compgen -W "$options" -- "$cur"))
        return
    fi
}

complete -F _doubao_tts_complete doubao-tts
