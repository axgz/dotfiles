#!/bin/bash

# prompt
# ------
# Source this in .zshrc to take effect, make sure to source themes that define the colour vars first!
#
# nvim ~/.zshrc
# ...
# source $HOME/.config/zsh/themes/catppuccin-mocha
# source $HOME/.config/zsh/plugins/prompt.sh
# ...
# EOF

# Find and set branch name var if in git repository.
function git_branch_name() {
    branch=$(git branch --show-current 2>/dev/null)
    if [[ $branch != "" ]]; then
        echo "%F{$THEME_COLOURS_GIT_BRANCH} $branch%f"
    fi
}

# Find number of untracked files
function git_files_untracked() {
    count=$(git ls-files --others --exclude-standard 2>/dev/null | wc -l)
    if [[ $count > 0 ]]; then
        echo "%F{$THEME_COLOURS_GIT_UNTRACKED} $count%f"
    fi
}

# Find number of staged files
function git_files_tracked() {
    count=$(git diff --name-only 2>/dev/null | wc -l)
    if [[ $count > 0 ]]; then
        echo "%F{$THEME_COLOURS_GIT_TRACKED} $count%f"
    fi
}

# Find number of unpushed commits
function git_commits_ahead() {
    branch=$(git branch --show-current 2>/dev/null)
    count=$(git rev-list --count origin/$branch..$branch 2>/dev/null)
    if [[ $count > 0 ]]; then
        echo "%F{$THEME_COLOURS_GIT_BRANCH}|+$count%f"
    fi
}

# Find number of unpulled commits
function git_commints_behind() {
    branch=$(git branch --show-current 2>/dev/null)
    count=$(git rev-list --count $branch..origin/$branch 2>/dev/null)
    if [[ $count > 0 ]]; then
        echo "%F{$THEME_COLOURS_GIT_BRANCH}|-$count%f"
    fi
}

# Enable substitution in the prompt.
setopt prompt_subst

# Create prompt
export PS1='%F{$THEME_COLOURS_PS1_PWD}%~$(git_branch_name)$(git_commits_ahead)$(git_commints_behind)$(git_files_tracked)$(git_files_untracked) %F{$THEME_COLOURS_PS1_PROMPT}> %F{$THEME_COLOURS_PS1_TEXT}'

