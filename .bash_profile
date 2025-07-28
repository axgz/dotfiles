# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
export LS_COLORS_ORIG=$LS_COLORS
export LS_COLORS="${LS_COLORS_ORIG}di=1;36:"

# fzf - enable key bindings
if [ -x "$(command -v fzf)"  ]
then
    source /usr/share/fzf/shell/key-bindings.bash
fi

