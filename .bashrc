# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'

# Old default prompt
#PS1='[\u@\h \W]\$ '

# Custom stuff
PS1='\[\e[38;5;244;1m\]\u\[\e[97m\]@\[\e[38;5;244m\]\h\[\e[39m\][\[\e[97m\]\w\[\e[39m\]]\n$? > \[\e[0m\]'
PS2='\n> \[\e[0m\]'

export EDITOR='nvim'
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR

alias e=$EDITOR
if [ "$EDITOR" == 'nvim' ]; then
  alias er="$EDITOR -R"
fi
