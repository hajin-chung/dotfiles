export LC_ALL=C.UTF-8
export LANG=C.UTF-8
# set timezone
TZ=/usr/share/zoneinfo/Asia/Seoul

TERM=xterm

# propmt colors
GREEN="\[\e[1;32m\]"
CYAN="\[\e[1;36m\]"
BLUE="\[\e[1;94m\]"
ENDCOLOR="\[\e[0m\]"

# pasting issue
bind 'set enable-bracketed-paste on'

# prompt
PS1="${GREEN}\u${ENDCOLOR} ${CYAN}  ${ENDCOLOR} ${CYAN}\w${ENDCOLOR} ${BLUE}\$${ENDCOLOR} "

# history config
HISTSIZE=100000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND='history -a'
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
bind '"\C-r": reverse-search-history'
bind '"\C-s": forward-search-history'

# aliases
alias ls='ls --color=auto'
alias ta='tmux a'

# path exports
export PATH=$PATH:/opt/nvim-linux-x86_64/bin
export PATH=$PATH:/usr/local/go/bin

. "$HOME/.local/bin/env"
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export SUDO_EDITOR=nvim
