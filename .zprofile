autoload -U colors && colors

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

_comp_options+=(globdots)

export EDITOR='nvim'
export TERMINAL='kitty'
export READER='zathura'
export FILE='ranger'

export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export ZDOTDIR="$HOME/.config/zsh"
export INPUTRC="$HOME/.config/inputrc"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"

export GREP_COLOR='1;35'

[ -f $HOME/.config/zsh/.zshrc ] && . $HOME/.config/zsh/.zshrc

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx

