
if [[ -e /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
    . /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
elif [[ -e /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
    . /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh
elif [[ -x "$(whence pacaur)" ]]; then
    echo 'pacaur -S zsh-history-substring-search'
elif [[ -x "$(whence zyp)" ]]; then
    echo 'zyp in zsh-history-substring-search'
fi
#if [[ -e /usr/share/zsh/plugins/zsh-directory-history/zsh-directory-history.zsh ]]; then
    #. /usr/share/zsh/plugins/zsh-directory-history/zsh-directory-history.zsh
#elif [[ -x "$(whence pacaur)" ]]; then
    #echo 'pacaur -S zsh-directory-history-git'
#fi
if [[ -e /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ -e /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ -x "$(whence pacaur)" ]]; then
    echo 'pacaur -S zsh-autosuggestions'
elif [[ -x "$(whence zyp)" ]]; then
    echo 'zyp in zsh-autosuggestions'
fi
if [[ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -e /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -x "$(whence pacaur)" ]]; then
    echo 'pacaur -S zsh-syntax-highlighting'
elif [[ -x "$(whence zyp)" ]]; then
    echo 'zyp in zsh-syntax-highlighting'
fi

zmodload -i zsh/complist
autoload -U compaudit compinit && compinit

unsetopt flowcontrol

unsetopt menucomplete
setopt list_ambiguous
setopt complete_in_word
setopt glob_complete
unsetopt complete_aliases
setopt always_to_end
setopt auto_param_slash
setopt interactivecomments
setopt no_nomatch
setopt no_nullglob
setopt no_listbeep

bindkey -M menuselect '^o' accept-and-infer-next-history
zle -C all-matches complete-word _generic
bindkey '^Xa' all-matches
zstyle ':completion:*' menu select=2
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path "$HOME/.cache/zsh/completion/"
zstyle ':completion:all-matches:*' old-matches only
zstyle ':completion:all-matches::::' completer _all_matches

zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'
zstyle '*' single-ignored show

source $HOME/.sh_aliases
source $HOME/.sh_paths
source $HOME/.sh_functions
source $HOME/.sh_colorize

# correct_all is stupid and whoever thought it was a good idea to set it is stupid.
setopt correct nocorrect_all

if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi
HISTSIZE=30000
SAVEHIST=100000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt extendedglob notify
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

