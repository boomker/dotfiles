#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ("$SHLVL" -eq 1 && ! -o LOGIN) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprofile"
fi
# zerobrew
export ZEROBREW_DIR=/Users/cyzhu/.zerobrew
export ZEROBREW_BIN=/Users/cyzhu/.local/bin
export ZEROBREW_ROOT=/opt/zerobrew
export ZEROBREW_PREFIX=/opt/zerobrew/prefix
export PKG_CONFIG_PATH="/opt/zerobrew/prefix/lib/pkgconfig:${PKG_CONFIG_PATH:-}"
_zb_path_append() {
    local argpath="$1"
    case ":${PATH}:" in
        *:"$argpath":*) ;;
        *) export PATH="$argpath:$PATH" ;;
    esac;
}
_zb_path_append $ZEROBREW_BIN
_zb_path_append $ZEROBREW_PREFIX/bin

# zerobrew
export PATH="/opt/zerobrew/prefix/bin:$PATH"
