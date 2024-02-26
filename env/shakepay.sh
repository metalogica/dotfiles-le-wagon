#!/bin/bash
# The folder to which you cloned the devops-tools repository
export DEVOPS_TOOLS_DIR="$HOME/code/shakepay/devops-tools"
source $DEVOPS_TOOLS_DIR/toolsrc

export JUMP_SCRIPT=$HOME/code/shakepay/devops-tools/jump.sh

export KUBECONFIG_DIR="$HOME/kubeconfig" # The folder where your kubeconfig files will live (will be created in the next step)
export ENABLE_CUSTOM_PROMPT="0" # Optional: Adds current kctxt and arch to prompt: [arm64] tim@Tims-MacBook-Pro devops-tools [prod] #

export QA_DB_REMOTE_PORT=15432
export QA_REPORTING_DB_REMOTE_PORT=15433

export QA2_DB_REMOTE_PORT=15432
export QA2_REPORTING_DB_REMOTE_PORT=15433

export PATH="$PATH:/opt/homebrew/bin"
