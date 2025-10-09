# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'

if [[ -f /usr/share/git/git-prompt.sh ]]; then
  source /usr/share/git/git-prompt.sh
  PS1='\[\e[38;5;244;1m\]\u\[\e[97m\]@\[\e[38;5;244m\]\h\[\e[39m\][\[\e[97m\]\w\[\e[39m\]][\j]$(__git_ps1 "(%s)")\n$? > \[\e[0m\]'
else
  echo '/usr/share/git/git-prompt.sh doesnt exist, current branch wont be shown in prompt'
  PS1='\[\e[38;5;244;1m\]\u\[\e[97m\]@\[\e[38;5;244m\]\h\[\e[39m\][\[\e[97m\]\w\[\e[39m\]][\j]\n$? > \[\e[0m\]'
fi

PS2='\n> \[\e[0m\]'

alias g='git'
alias ll='ls -lah'

# "fgrep here"
alias fgh='grep -rnI --color=auto . -e'

export EDITOR='nvim'
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR

alias e=$EDITOR
if [[ "$EDITOR" == @(nvim|vim|vi) ]]; then
  alias er="$EDITOR -R"
  alias ed="$EDITOR -d"
fi
