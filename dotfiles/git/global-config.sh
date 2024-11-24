#!/bin/bash
set -e

set_git_config() {
    git config --global "$1" "$2"
}

# Obtained from the output of `git config --global --list'
set_git_config "user.name"          "8dcc"
set_git_config "user.email"         "8dcc.git@gmail.com"
set_git_config "user.signingkey"    "228C104965317F9A"
set_git_config "core.editor"        "nvim"
set_git_config "credential.helpers" "store"
set_git_config "commit.gpgsign"     "true"
set_git_config "pull.rebase"        "false"
set_git_config "init.defaultbranch" "main"

echo "All done."
