# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# Set up the prompt (PS1)
source /usr/share/git-core/contrib/completion/git-prompt.sh 

PS1='\[\e[38;5;214;1m\]\w\[\e[0m\]$(__git_ps1 " [%s]")\n\[\e[38;5;41;1m\]\u\[\e[0m\]@\[\e[38;5;33;1m\]\h\[\e[0m\] [\A]$ '


# Enable color support for ls and add handy aliases
if command -v dircolors > /dev/null 2>&1; then
    # Enable color support for ls and use default LS_COLORS
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Some useful aliases
alias ll='ls -alF'     # Long list, including hidden files
alias la='ls -A'       # List all files, except . and ..
alias l='ls -CF'       # Compact format list
alias ..='cd ..'       # Easy navigation to parent directory

alias ud='sudo dnf update && flatpak upgrade'
alias s='flameshot gui -p ~/Pictures/Screenshots'

# Environment variables
export EDITOR=nano        # Set default editor to nano
export HISTSIZE=1000      # Set the history size
export HISTFILESIZE=2000  # Set the history file size

# Enable Bash completion if available
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# Add custom paths (example: adding ~/.local/bin)
export PATH="$HOME/.local/bin:$PATH"

# Add an alias to reload .bashrc
alias reload='source ~/.bashrc'

# Add a welcome message (optional)
echo "Welcome, $USER! You are in $PWD."
fastfetch



# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/$USER/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/$USER/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/$USER/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/$USER/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/$USER/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/$USER/miniforge3/etc/profile.d/mamba.sh"
fi

mamba activate geo

# <<< conda initialize <<<
