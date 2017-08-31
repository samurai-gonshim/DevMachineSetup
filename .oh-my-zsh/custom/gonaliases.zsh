#------------------
# personal ENV
#------------------


#------------------
# personal aliases
#------------------

alias a='alias'
alias v='vim'
alias vi='vim'
alias cls='clear'
alias so='source'
alias sozsh='source ~/.zshrc'
#alias termh='gnome-terminal --working-directory="~"'
#alias term='gnome-terminal'
#alias nau='nautilus'	# file browser
#alias subl='sublime'
alias h='history'
alias code='cd ~/Code'
alias art='php artisan'

#-------------
# git aliases
#--------------

alias ga='git add'
alias gs='git status'
alias gl='git log'
alias gco='git checkout'
alias gm='git commit -m'

#----
# pbcopy
# ---
if which xsel >/dev/null 2>&1 ; then
   # linux
   alias pbcopy='xsel --input --clipboard'
   alias pbpaste='xsel --output --clipboard'
fi
