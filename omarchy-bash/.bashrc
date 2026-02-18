################################################################################
# Omarch Defaults!
################################################################################
# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# Only run in Bash; skip otherwise
if [ -z "$BASH_VERSION" ]; then
    echo "Warning: bash profile is designed for Bash. Skipping the rest..." >&2
    return 0 2>/dev/null
fi

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

alias full-update='sudo pacman -Syyu' # Update and upgrade, then clean

################################################################################
# Origin of this was Obsidian Default Profile
# I've tried to keep Omarchy magic above here only, but still might not work
# on all OS's
################################################################################

# Shared configs
MY_REPOSITORIES=~/Repositories
MY_EDITOR=nvim

# Generic junk
################################################################################
export PATH="$HOME/.local/bin:$PATH"

if command -v kubectl --help &> /dev/null # kubectl
then
    source <(kubectl completion bash)
fi

if command -v xclip --help &> /dev/null # Only setup "pbcopy" (xclip) if installed
then
    alias pbcopy="xclip -sel clip"
fi

# Repository and Git stuff
################################################################################
# Set NVIM as default editor
VISUAL="$MY_EDITOR"
EDITOR="$VISUAL"

alias repo="cd ${MY_REPOSITORIES}" # Jump to repos
alias reporoot='cd $(git rev-parse --show-toplevel)' # Jump to current repo root

# Quick navigation to repositories with fzf
if command -v fzf --help &> /dev/null # some safety
then
    repos() {
        local project_dir="$MY_REPOSITORIES" # Change me if reusing function!

        if [[ -z "$1" ]]; then
            # No argument provided - use fzf to select
            local selected
            selected=$(ls -1 "$project_dir" | fzf --prompt="Select repository > " --height=40% --layout=reverse --border)

            if [[ -n "$selected" ]]; then
                cd "$project_dir/$selected"
            fi
        else
            # Argument provided - cd directly
            if [[ -d "$project_dir/$1" ]]; then
                cd "$project_dir/$1"
            else
                echo "Repository '$1' not found in $project_dir"
                return 1
            fi
        fi
    }

    
    _repos_completion() {
        local project_dir="$MY_REPOSITORIES" # Change me if reusing function!
        local cur="${COMP_WORDS[COMP_CWORD]}"

        COMPREPLY=($(compgen -W "$(ls -1 "$project_dir" 2>/dev/null)" -- "$cur"))
    }
    complete -F _repos_completion repos # And change me if you change the method signature
fi

# tmux
################################################################################
# Start/Attach to tmux
alias tmux-join='tmux attach -t primary || tmux new -s primary'

# Tmux start/reconnect by default (skip if SSH session)
if [ -z "$TMUX" ] && [ -z "$SSH_TTY" ]
then
    tmux-join
fi

# Terraform
################################################################################
tfinit() {
    terraform init $@
}
tfplan() {
    terraform plan $@
}
tfapply() {
    terraform apply $@
}
tfdestroy() {
    terraform destroy $@
}
tfvalidate() {
    terraform validate $@
}
tffmt() {
    terraform fmt --recursive $@
}
tfworkspace() {
    terraform workspace $@
}
tfdoc() {
    terraform-docs .
}
tflock() {
    terraform providers lock \
        -platform=windows_amd64 \
        -platform=darwin_amd64 \
        -platform=linux_amd64 \
        -platform=darwin_arm64 \
        -platform=linux_arm64
}

################################################################################
# End of Obsidian Default Profile - But then warped for Arch/Omarchy
################################################################################
