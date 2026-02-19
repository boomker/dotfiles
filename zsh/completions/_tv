
# ╭──────────────────────────────────────────────────────────╮
# │      Television Channel参数补全                          │
# ╰──────────────────────────────────────────────────────────╯
_tv() {
    local cable_dir="${HOME}/.config/television/cable"
    typeset -A chan_map
    # 内置默认值
    chan_map=(
        'alias' 'Alias channel'
        'bash-history' 'Bash history channel'
        'dirs' 'Directories channel'
        'docker-images' 'Docker images channel'
        'env' 'Environment variables channel'
        'files' 'Files channel'
        'git-branch' 'Git branches channel'
        'git-diff' 'Git diff channel'
        'git-log' 'Git log channel'
        'git-repos' 'Git repositories channel'
        'text' 'Text search channel'
    )
    # 扫描目录并解析描述
    if [[ -d "$cable_dir" ]]; then
        for f in "$cable_dir"/*.toml(N); do
            local name="${f:t:r}"
            # 使用 awk 提取描述：
            local desc=$(awk '/description =/ {
                sub(/.*description =[[:space:]]*/, "");
                if ($0 ~ /^("""|'\'\'\''|"|'\'')\s*$/ || $0 == "") { getline; }
                gsub(/^[[:space:]]*["'\'']+|["'\'']+[[:space:]]*$/, "");
                if ($0 != "") { print $0; exit; }
            }' "$f")
            # 如果读到了描述，存入 Map（如果是内置同名频道，会覆盖旧描述）
            if [[ -n "$desc" ]]; then
                # 限制描述长度，防止 fzf 界面乱掉（可选）
                [[ ${#desc} -gt 70 ]] && desc="${desc[1,67]}..."
                chan_map[$name]="$desc"
            else
                # 如果文件里真没写描述，且 Map 里也没有（说明不是内置频道），给个默认文案
                [[ -z "${chan_map[$name]}" ]] && chan_map[$name]="Custom channel"
            fi
        done
    fi
    # 转换回 _arguments 需要的格式
    local -a channels
    for k v in ${(kv)chan_map}; do
        channels+=("${k}:${v}")
    done

    _arguments -s \
        '--help[Show help]' \
        '--version[Show version]' \
        '1:channel:(($channels))' \
        '*:filename:_files'
}

compdef _tv tv
