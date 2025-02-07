# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# to manually source any plugin
# source ~/.config/zsh/fzf-tab.plugin.zsh

# source haskell
[ -f "/home/kamal/.ghcup/env" ] && . "/home/kamal/.ghcup/env" # ghcup-env
source /home/kamal/.config/broot/launcher/bash/br

# source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
# eval "$(starship init zsh)"

# zsh plugs
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "marlonrichert/zsh-autocomplete"
plug "Aloxaf/fzf-tab"
plug "kazhala/dotbare"
# plug "zdharma-continuum/fast-syntax-highlighting"

export TERM=alacritty
export KEYTIMEOUT=5
export MANPAGER="$(which nvim) +Man!"
export XDG_CURRENT_DESKTOP=Unity
export _ZO_ECHO=1
export GPG_TTY=$(tty)
export DOCKER_BUIDKIT=1
# export QT_QPA_PLATFORMTHEME=qt5ct
export LANG=en_US.UTF-8
# export LANGUAGE=en_US:en
export LC_ALL="en_US.UTF-8"
# export LANG=C.UTF-8
# export LC_CTYPE=C.UTF-8

export DOTBARE_DIR="$HOME/.dotfiles"
export DOTBARE_TREE="$HOME"

# Load and initialise completion system
# autoload -Uz compinit
# compinit

bindkey -v
bindkey -M menuselect '^H' vi-backward-char
bindkey -M menuselect '^K' vi-up-line-or-history
bindkey -M menuselect '^L' vi-forward-char
bindkey -M menuselect '^J' vi-down-line-or-history

bindkey -M viins '^H' vi-backward-char
bindkey -M viins '^K' vi-up-line-or-history
bindkey -M viins '^L' vi-forward-char
bindkey -M viins '^J' vi-down-line-or-history

bindkey -M viins '^P' vi-up-line-or-history
bindkey -M viins '^N' vi-down-line-or-history

bindkey -M viins '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line
bindkey -M viins '^I' fzf-tab-complete

# Setting fd as the default source for fzf
# export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b,fg:#d0b979'
# export FZF_DEFAULT_OPTS='--no-height --color=pointer:#31304D,gutter:-1,info:#0dbc79,hl:#FF0000,hl+:#3b4252,fg:#C0C0C0,bg+:#B6BBC4'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"
LS_COLORS='no=00;32:fi=00;32:di=01;34:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
export LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# customCol='no=01;32:fi=01;32:di=01;34:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
# zstyle ':all-matches:*' list-colors ${(s.:.)customCol}


# set nvim as default editor
if [ $(command -v nvim) ]; then
	export EDITOR=$(which nvim)
	alias vim=$EDITOR
fi

export SUDO_EDITOR=$EDITOR
export VISUAL=$EDITOR

# MANPAGER
# export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
unsetopt nomatch

# juspay
export DB_USER="juskml"
export DB_PASS="juspkml"
export DB_NAME="hyperswitch_db"
# export DATABASE_URL=postgres://$DB_USER:$DB_PASS@localhost:5432/$DB_NAME

alias zcon="vim ~/.config/zsh/.zshrc"
alias zsou="source $ZSHRC"
alias vi="vim -u NONE"
alias v="\vim"
alias svim='sudo nvim'
alias c='clear'
alias cp="cp -r"
alias rm="rm -i"
alias t="tree"
alias q="exit"
alias mkcd='foo(){ mkdir -p "$1"; cd "$1" }; foo '
alias rg='rg -i'
alias lg='lazygit'
alias whe='pwd'
alias -- -="z -"
alias ..='z ..'
alias ...='z ../..'
alias ....='z ../../..'
alias p='python3'
alias fman='compgen -c | fzf | xargs man'
alias tl='tldr'
alias ff='fastfetch'
alias bare='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree ~'
alias db='dotbare'
alias res='nmcli device wifi rescan'
alias bp='btop'

# changes default packages
alias cd='z'
alias ls="eza --icons --git --group-directories-first"
alias la="eza -a --icons --git --group-directories-first"
alias ll="eza -la --icons --git --group-directories-first"
alias lf="eza -f --icons"
alias lfa="eza -a -f --icons"
alias lt="eza --icons --git --tree -L=3 --group-directories-first"
# alias lt="eza -a --icons --git --tree -L=3 --group-directories-first"
alias lss="eza --icons --git -rs=modified"
alias du="ncdu"
alias ps="procs"
alias curl='curlie'
alias cat='bat'
alias grep='rg'
alias nano="vim"

#pacman alias
alias pac='sudo pacman -S'
alias pacr='sudo pacman -Rns'     # removes dependencies and cache
alias pacs='sudo pacman -Ss'      # search
alias paci='sudo pacman -Si'      # info
alias pacq='sudo pacman -Qs'      # query locally
alias pacc='sudo pacman -Scc'     # clean cache
alias pacls='pacman -Qe'          # installed packages
alias pacup='sudo pacman -Syu'    # update, add 'a' to the list of letters to update AUR packages if you use yaourt
alias paclo='pacman -Qdtq'        # list orphans
alias pacro='paclo && sudo pacman -Rns $(pacman -Qtdq)' # remove orphans
# alias paclf='pacman -Ql'        # list files

# rust alias
alias cr='cargo run'
alias ct='cargo test -- --show-output' # `--nocapture` works as well
alias cck='cargo check'
alias crb='cargo run --bin'
alias cre='cargo run --example'

# nix alias
alias npi='nix profile install'
alias npr='nix profile remove'
alias npl='nix profile list | grep "Name:" | awk "{print $2}"'
alias npu='nix profile upgrade --all'
alias nph='nix profile history'
alias nixgc='nix-store --gc'

# docker alias
alias dup="docker compose up -d"
alias ddown="docker compose down"
alias dres="docker compose restart"
alias dimages="docker images"
alias dimagesa="docker images -a"
alias dpsa="docker ps -a"
alias dex="docker exec -it"
alias dimagepurne="docker image prune -f"
alias dsystempurne="docker system prune --all"

# tmux
alias tmls="tmux ls"
alias tma="tmux attach"
alias tmks="tmux kill-session -t"

# haskell
alias hask="ghci"
alias crun="cabal run"
alias gtui="ghcup tui"

alias click="foo(){ cd ~/ground/click; clickhouse "$@";}; foo "

export ch_url='http://localhost:8123'
export ch_host='localhost'
export ch_password='clickhouse'
export ch_user='clickhouse'
export ch_username='default'
export ch_port='9000'
export uplink_host="localhost"
export uplink_port="3000"
export pg_url='postgresql://stream_analytics:bitabeam@localhost/stream_analytics'
export sessions_file_path=/home/gautam/workspace/bytebeam/bytebeam/stream-analytics-service/rust-sessions/generated-sessions/sessions.csv
export consoled_endpoint='http://foobar.com'
export bytebeam_api_key='dfdsfdsfss'
