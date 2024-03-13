autoload -U zmv
# Completion
autoload -Uz compinit
# zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --icons --git --color=always $realpath'

# Docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
# fzf-tab previews
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git show --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview 'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
    'case "$group" in
    "commit tag") git show --color=always $word ;;
    *) git show --color=always $word | delta ;;
    esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
    'case "$group" in
    "modified file") git diff $word | delta ;;
    "recent commit object name") git show --color=always $word | delta ;;
    *) git log --color=always $word ;;
    esac'

# # Fuzzy match mistyped completions.
# zstyle ':completion:*' completer _complete _list _match _approximate
# zstyle ':completion:*:match:*' original only
# zstyle ':completion:*:approximate:*' max-errors 1 numeric
# # Increase the number of errors based on the length of the typed word.
# zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
# # Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|.*|pre(cmd|exec))'
# # Group matches and describe.
zstyle ':completion:*:corrections' format '%B%F{green}%d (errors: %e)%f%b'
zstyle ':completion:*:messages' format '%B%F{yellow}%d%f%b'
zstyle ':completion:*:warnings' format '%B%F{red}No such %d%f%b'
zstyle ':completion:*:errors' format '%B%F{red}No such %d%f%b'
zstyle ':completion:*:descriptions' format $'%{\e[35;1m%}%d%{\e[0m%}'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# # Don't wrap around when navigating to either end of history
# zstyle ':completion:*:history-words' stop yes
# zstyle ':completion:*:history-words' remove-all-dups yes
# zstyle ':completion:*:history-words' list false
# zstyle ':completion:*:history-words' menu yes
# # Exclude internal/fake envvars
# zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}
# # Sory array completion candidates
# zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
# # Complete hostnames from ssh files too
# zstyle -e ':completion:*:hosts' hosts 'reply=(
#   ${=${=${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
#   ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
# )'
# # Don't complete uninteresting users
# zstyle ':completion:*:users' ignored-patterns \
#   adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
#   dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
#   hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
#   mailman mailnull mldonkey mysql nagios \
#   named netdump news nfsnobody nobody 'nixbld*' nscd ntp nut nx openvpn \
#   operator pcap postfix postgres privoxy pulse pvm quagga radvd \
#   rpc rpcuser rpm shutdown squid sshd sync 'systemd-*' uucp vcsa xfs '_*'
# # ... unless we really want to.
# zstyle '*' single-ignored show
# # Ignore multiple entries.
# zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
# zstyle ':completion:*:rm:*' file-patterns '*:all-files'
# PID completion for kill
zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single
# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
# # Media Players
# zstyle ':completion:*:*:mpg123:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
# zstyle ':completion:*:*:mpg321:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
# zstyle ':completion:*:*:ogg123:*' file-patterns '*.(ogg|OGG|flac):ogg\ files *(-/):directories'
# zstyle ':completion:*:*:mocp:*' file-patterns '*.(wav|WAV|mp3|MP3|ogg|OGG|flac):ogg\ files *(-/):directories'
# # SSH/SCP/RSYNC
# zstyle ':completion:*:(scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
# zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
# zstyle ':completion:*:ssh:*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
# zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
# zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
# zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
# zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'
#
#
# # zstyle ':completion:*:*:*:*:*' menu select
#
# # # Complete . and .. special directories
zstyle ':completion:*' special-dirs true
#
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#
# # zstyle ':completion:*' use-cache on
# # zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
#
# zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
#                                            /usr/local/bin  \
#                                            /usr/sbin       \
#                                            /usr/bin        \
#                                            /sbin           \
#                                            /bin
#
compinit
