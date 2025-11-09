################################################################################
# Omarch Defaults!
################################################################################
# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

################################################################################
# Obsidian Default Profile - But then warped for Arch/Omarchy
################################################################################
# Jump to repos
alias repo='cd ~/Repositories'
# Update and upgrade, then clean
alias full-update='sudo pacman -Syyu'
# Set NVIM as default editor
VISUAL=nvim
EDITOR="$VISUAL"

export PATH="$HOME/.local/bin:$PATH"

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

# kubectl
if command -v kubectl --help &> /dev/null
then
    source <(kubectl completion bash)
fi

# Only setup "pbcopy" (xclip) if installed
if command -v xclip --help &> /dev/null
then
    alias pbcopy="xclip -sel clip"
fi

# Tmux start/reconnect by default
if [ -z "$TMUX" ]
then
    tmux attach -t primary || tmux new -s primary
fi

################################################################################
# End of Obsidian Default Profile - But then warped for Arch/Omarchy
################################################################################
