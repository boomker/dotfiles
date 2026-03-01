
if [[ -z "$__VFOX_PID" || -z "$__VFOX_SHELL" ]]; then
  export PATH="/Users/cyzhu/.bun/bin:/Users/cyzhu/.pnpm/bin:/Users/cyzhu/go/bin:/Users/cyzhu/.cargo/bin:/opt/zerobrew/prefix/bin:/Users/cyzhu/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/opt/pmk/env/global/bin:/opt/podman/bin:/Users/cyzhu/.zerobrew/bin:/Applications/Ghostty.app/Contents/MacOS";export __VFOX_CURTMPPATH=$'/Users/cyzhu/.vfox/tmp/20260301-60549';

  export __VFOX_PID=$$;
  export __VFOX_SHELL='zsh';

  _vfox_hook() {
    trap -- '' SIGINT;
    
    # Check if PID changed (e.g., in tmux new pane)
    if [[ "$$" != "$__VFOX_PID" ]]; then
      export __VFOX_PID=$$;
    fi
    
    eval "$("/opt/homebrew/bin/vfox" env -s zsh)";
    trap - SIGINT;
  }
  typeset -ag precmd_functions;
  if [[ -z "${precmd_functions[(r)_vfox_hook]+1}" ]]; then
    precmd_functions=( _vfox_hook ${precmd_functions[@]} )
  fi
  typeset -ag chpwd_functions;
  if [[ -z "${chpwd_functions[(r)_vfox_hook]+1}" ]]; then
    chpwd_functions=( _vfox_hook ${chpwd_functions[@]} )
  fi

  trap 'vfox env --cleanup' EXIT
fi
