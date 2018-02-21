# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

if [ ! -e "$ZSH" ]
then
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="xiong-chiamiov-plus"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

URLTOOLS_METHOD="python"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(encode64 extract gem git gitfast git-extras github gpg-agent heroku history history-substring-search rsync ruby screen python ssh-agent systemd archlinux urltools zsh-syntax-highlighting per-directory-history)
# command-not-found
# themes
# vi-mode

source $ZSH/oh-my-zsh.sh

# {{{ Aliases
alias ls="ls -F --color=always"
alias ll="ls -l"
alias la="ls -a"
alias lsr="ls -lSr"
alias grep="grep --color=always ${GREP_OPTIONS}"
alias mv="mv -i"

alias ':q'='exit'

export LESS='-R'

# GREP has deprecated it and complains constantly
unset GREP_OPTIONS

alias engage="play -n -c1 synth whitenoise band -n 100 20 band -n 50 20 gain +25  fade h 1 864000 1"
alias engage-high="play -c2 -n synth whitenoise band -n 100 24 band -n 300 100 gain +20"

alias astyle-c="astyle -t4 -L -m2 -f -p -U -k3 -W3 --brackets=stroustrup -j -O -xC80 -z2"
# }}}

# correct_all is stupid and whoever thought it was a good idea to set it is stupid.
setopt correct nocorrect_all


HISTFILE=~/.histfile
HISTSIZE=30000
SAVEHIST=100000
setopt appendhistory extendedglob notify hist_ignore_dups extendedhistory
bindkey '[3~' delete-char

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export BROWSER="chromium"
export EDITOR="nvim"
export PAGER="/usr/bin/less"
export MANPAGER="/usr/bin/less"

export SQUEAK_IMAGE=$HOME/.squeak/squeak.image

export GOPATH=$HOME/.local/gocode

export PATH="$PATH:$HOME/.local/bin:$HOME/.cabal/bin:$HOME/.local/gocode/bin"
if [ -f ~/.profile ]; then
	source ~/.profile
fi
if [ -e ~/.local/share/x-tools ]; then
	for xtool in $HOME/.local/share/x-tools/*-*/bin
	do
		export PATH="$PATH:${xtool}"
	done
fi
#export PATH="/usr/lib/colorgcc/bin:${PATH}"

# {{{ Manual pages
#     - colorize, since man-db fails to do so
export LESS_TERMCAP_mb=$'\E[01;31m'   # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'   # begin bold
export LESS_TERMCAP_me=$'\E[0m'       # end mode
export LESS_TERMCAP_se=$'\E[0m'       # end standout-mode
export LESS_TERMCAP_so=$'\E[1;33;40m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'       # end underline
export LESS_TERMCAP_us=$'\E[1;32m'    # begin underline
# }}}

autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{28}●'
zstyle ':vcs_info:*' unstagedstr '%F{11}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn cvs darcs hg
zstyle ':vcs_info:*' disable bzr

# Get local weather and present it nicely
weather() {
  # We require 'curl' so check for it
  if ! command -v curl &>/dev/null; then
    printf "%s\n" "[ERROR] weather: This command requires 'curl', please install it."
    return 1
  fi

  # If no arg is given, default to Bellingham, WA
  curl -m 10 "http://wttr.in/${*:-Bellingham,+WA}" 2>/dev/null || printf "%s\n" "[ERROR] weather: Could not connect to weather service."
}

if [ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]
then
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
