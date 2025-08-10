# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
if [[ -z $LS_COLORS_ORIG ]]; then
    export LS_COLORS_ORIG=$LS_COLORS
fi
export LS_COLORS="${LS_COLORS_ORIG}di=1;36:"

# fzf - enable key bindings
if [ -x "$(command -v fzf)"  ]
then
    source /usr/share/fzf/shell/key-bindings.bash
fi

# Define Rosé Pine colors (simplified example)
ROSE_PINE_FG='\e[38;2;229;224;216m' # Foreground color
ROSE_PINE_ACCENT='\e[38;2;199;188;220m' # Accent color
RESET='\e[0m' # Reset color

# Configure PS1
export PS1="${ROSE_PINE_ACCENT}\u@\h${RESET}:${ROSE_PINE_FG}\w${RESET}\$ "


source "$HOME/.env_vars"

