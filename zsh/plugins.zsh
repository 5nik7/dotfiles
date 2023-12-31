# Configure and load plugins using Zinit's
ZINIT_HOME="${ZINIT_HOME:-${XDG_DATA_HOME:-${HOME}/.local/share}/zinit}"

# Added by Zinit's installer
if [[ ! -f ${ZINIT_HOME}/zinit.git/zinit.zsh ]]; then
    print -P "%F{14}▓▒░ Installing Flexible and fast ZSH plugin manager %F{13}(zinit)%f"
    command mkdir -p "${ZINIT_HOME}" && command chmod g-rwX "${ZINIT_HOME}"
    command git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}/zinit.git" && \
        print -P "%F{10}▓▒░ Installation successful.%f%b" || \
        print -P "%F{9}▓▒░ The clone has failed.%f%b"
fi

source "${ZINIT_HOME}/zinit.git/zinit.zsh"

zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    hlissner/zsh-autopair \
    zdharma-continuum/fast-syntax-highlighting \
    MichaelAquilina/zsh-you-should-use \
    zsh-users/zsh-autosuggestions \
    Aloxaf/fzf-tab \
    ael-code/zsh-colored-man-pages \
    tj/git-extras


zinit ice wait'3' lucid
zinit light zsh-users/zsh-history-substring-search

zinit ice wait'2' lucid
zinit light zdharma-continuum/history-search-multi-word

zinit ice as="program" from="gh-r" mv="tree* -> tree-sitter" pick="tree-sitter"
zinit light tree-sitter/tree-sitter

zinit ice lucid wait="0" nocompile nocompletions
zinit light microsoft/vscode-node-debug2.git

zinit ice lucid wait"0" as"program" from"gh-r"
zinit light solidiquis/erdtree

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

## zinit plugin config
zstyle ':completion:*' matcher-list 'r:|?=** m:{a-z\-}={A-Z\_}'
zstyle ':completion:*' menu select
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' verbose no
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd *"
export ZSH_AUTOSUGGEST_COMPLETION_IGNORE="git *"
export ZSH_AUTOSUGGEST_USE_ASYNC="true"
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor regexp root line)
export ZSH_HIGHLIGHT_MAXLENGTH=512
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$base04"

##
## Prompt
##

# Download starship if not installed
if ! command -v starship >/dev/null 2>&1 ; then
    if command -v starship >/dev/null 2>&1 ; then
        curl -sS https://starship.rs/install.sh | sh
    fi
fi

# Load starship
export STARSHIP_CONFIG="${DOTFILES}/starship/starship.toml"
eval $(starship init zsh)
# vim:ft=zsh
