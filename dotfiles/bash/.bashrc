# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source all .sh files from .bashrc.d directory
if [ -d ~/.bashrc.d ]; then
    for i in ~/.bashrc.d/*.sh; do
        if [ -r "$i" ]; then
            . "$i"
        fi
    done
    unset i
fi

# Source personal aliases if the file exists
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
