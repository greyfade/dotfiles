# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

if [ ! -e "$ZSH" ]
then
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

plugins=(encode64 extract gem git gitfast git-extras github gpg-agent heroku history history-substring-search rsync ruby screen python ssh-agent systemd archlinux urltools zsh-syntax-highlighting per-directory-history)
# vi-mode

source $HOME/.sh_colorize

source $ZSH/oh-my-zsh.sh

source $HOME/.sh_aliases
source $HOME/.sh_paths

# correct_all is stupid and whoever thought it was a good idea to set it is stupid.
setopt correct nocorrect_all

HISTSIZE=30000
SAVEHIST=100000
setopt appendhistory extendedglob notify hist_ignore_dups extendedhistory
bindkey '[3~' delete-char

if [ -f ~/.profile ]; then
	source ~/.profile
fi

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

# eval `ssh-agent -s`

if [ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]
then
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
