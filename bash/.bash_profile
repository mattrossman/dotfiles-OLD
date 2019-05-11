export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# NOTES:
# \e is the same as \033 for ESCAPE character
export PS1="\[\e[92m\]\u@\h\[\e[0m\] \[\e[94m\]\W\[\e[0m\]\[\033[38;5;202m\]\$(parse_git_branch)\[\033[00m\] $ "

# ALIASES
alias g=git
alias gnka='ssh a0413597@guernika.lab.inf.uc3m.es'
alias server='python -m http.server'

# configure thefuck if it's installed
if [ $(command -v thefuck) ]; then
    eval $(thefuck --alias)
fi

# optional local overrides
if [ -f $HOME/.bash_local ]; then
    source $HOME/.bash_local
fi

# fasd config if installed
if [ $(command -v fasd) ]; then
    eval "$(fasd --init posix-alias posix-alias bash-hook bash-ccomp)"
fi
