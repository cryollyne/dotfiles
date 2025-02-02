#
# ~/.bashrc
#

# env variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CASHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_STATE_HOME="$HOME/.local/state"

export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$PATH:~/.local/bin/:$HOME/.ghcup/bin/:/opt/shader-slang-bin/bin/"

if command -v nvim &> /dev/null; then
    export EDITOR="/usr/bin/nvim"
elif command -v vim &> /dev/null; then
    export EDITOR="/usr/bin/vim"
else
    export EDITOR="/usr/bin/vi"
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bind 'set completion-ignore-case on'
if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi

PS1="\[\e[1;36m\]\u\[\e[0m\]@\[\e[1;36m\]\h \[\e[1;35m\]\W \[\e[0m\]$ "
PS2='$( getPS2 () { local ps a; ps="$(perl -pe "s|\\\\\[.*?\\\\\]||g" <<<"${PS1}")"; echo "${ps@P}" | sed "s/\\x1B\\[[0-9;]\\{1,\\}[A-Za-z]//g;s/[]//g;s/./ /g";}; getPS2)    '

if [ -e "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

HISTCONTROL=ignoreboth
export LC_ALL="C.UTF-8"


set -o vi
alias make="make -j$(nproc)"
alias vi='vim'

if command -v nvim &> /dev/null; then
    alias vim='nvim'
fi

if command -v exa &> /dev/null; then
    alias ls='exa'
fi

if command -v bat &> /dev/null; then
    alias cat='bat -pp'
fi

if command -v rg &> /dev/null; then
    alias grep='rg'
fi

if command -v powerline-shell &> /dev/null; then

    function _update_ps1() {
        # PS1="$(powerline-shell $? | sed 's//?\\[??\\]/g' | sed 's/✎/?\\[??\\]/g')"
        PS1="$(powerline-shell $?)"
    }

    if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
        PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
    fi

    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/share/powerline/bindings/bash/powerline.sh

fi

