# propmt colors
GREEN="\e[1;32m"
CYAN="\e[1;36m"
BLUE="\e[1;94m"
ENDCOLOR="\e[0m"

# prompt
PS1="${GREEN}\u${ENDCOLOR} ${CYAN}\w${ENDCOLOR} ${BLUE}\$${ENDCOLOR} "
# PS1="\u \w $ "

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

# timezone
export TZ=/usr/share/zoneinfo/Asia/Seoul

# path exports
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:/opt/nvim-linux64/bin
