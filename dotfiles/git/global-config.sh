#!/bin/bash
set -e

HOOKS_DIR="${HOME}/.config/git/hooks"

set_git_config() {
    git config --global "$1" "$2"
}

# Obtained from the output of `git config --global --list'
set_git_config "user.name"          "8dcc"
set_git_config "user.email"         "8dcc.git@gmail.com"
set_git_config "user.signingkey"    "228C104965317F9A"
set_git_config "core.editor"        "nvim"
set_git_config "credential.helper"  "store"
set_git_config "commit.gpgsign"     "true"
set_git_config "commit.verbose"     "false"    # Perhaps change in some systems
set_git_config "pull.rebase"        "false"
set_git_config "init.defaultbranch" "main"

if [ -d "$HOOKS_DIR" ]; then
    set_git_config "core.hooksPath" "$HOOKS_DIR"
else
    echo "warning: Directory '${HOOKS_DIR}' does not exist. Not assining." 1>&2
fi

echo "All done."
