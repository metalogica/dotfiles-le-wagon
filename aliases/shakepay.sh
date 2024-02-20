#!/bin/bash
# simulators
alias iossmall="react-native run-ios --scheme \"Shaketh Debug\" --configuration \"Debug\" --simulator \"iPhone SE (2nd generation)\""

# run a single test
stest() { DATABASE_URL=postgres://postgres:@127.0.0.1:5432/shakepay_test DATABASE_URL_READONLY=postgres://postgres:@127.0.0.1:5432/shakepay_test DATABASE_URL_REPORTING=postgres://postgres:@127.0.0.1:5432/shakepay_reporting_test DATABASE_URL_REPORTING_READONLY=postgres://postgres:@127.0.0.1:5432/shakepay_reporting_test DATABASE_URL_MIGRATIONS=postgres://postgres:@127.0.0.1:5432/shakepay_test APP_TYPE=shakeboard LIGHTSHIP_PORT=5005 NODE_ENV=test TS_NODE_TRANSPILE_ONLY=true npx -w apps/backend mocha --config /Users/richardjarram/code/shakepay/shake-hosted-wallet/apps/backend/.mocharc.dev.json `echo "$1"` } #| sed 's/apps\/backend\///'`}

# run devtest in test container
devtest() { DATABASE_URL=postgres://postgres:@127.0.0.1:5432/shakepay_test DATABASE_URL_READONLY=postgres://postgres:@127.0.0.1:5432/shakepay_test DATABASE_URL_REPORTING=postgres://postgres:@127.0.0.1:5432/shakepay_reporting_test DATABASE_URL_REPORTING_READONLY=postgres://postgres:@127.0.0.1:5432/shakepay_reporting_test DATABASE_URL_MIGRATIONS=postgres://postgres:@127.0.0.1:5432/shakepay_test APP_TYPE=shakeboard LIGHTSHIP_PORT=5005 NODE_ENV=test npm run -w apps/backend devmocha }

# run dev test in container (2)
alias stestfull="docker-compose -f /Users/richardjarram/code/shakepay/shake-hosted-wallet/docker-compose.test.yml run test"

# run async processor
alias sasync="PORT=5001 LIGHTSHIP_PORT=5005 npx nodemon -w apps/backend ./apps/backend/src/jobs/async-processor-consumer.js"
# run shake board in debug mode
alias sboard="npm run -w apps/backend dev-shakeboard"

# run backend in debug mode
alias sapi="npm run -w apps/backend dev"

# jump scripts
JUMP_SCRIPT=$HOME/code/shakepay/devops-tools/jump.sh
sj () {
    if [[ $1 = 'mq' ]]
    then
        $JUMP_SCRIPT shakepay-dev.marqeta.com 443 9090
        
    elif [[ $1 = 'qa' ]]
    then
        $JUMP_SCRIPT backendqa-cluster.cluster-criaf4lhc3h5.ca-central-1.rds.amazonaws.com 5432 15432
        
    elif [[ $1 = 'qa2' ]]
    then
        $JUMP_SCRIPT backendqa2-cluster.cluster-criaf4lhc3h5.ca-central-1.rds.amazonaws.com 5432 15432
        
    fi
}

# run database migrations
alias smigrate="cd /Users/richardjarram/code/shakepay/shake-hosted-wallet/libs/database && DATABASE_URL_MIGRATIONS=postgres://postgres:@127.0.0.1:5432/shakepay_test npx sequelize db:migrate && cd -"

alias smigrate:undo="cd /Users/richardjarram/code/shakepay/shake-hosted-wallet/libs/database && DATABASE_URL_MIGRATIONS=postgres://postgres:@127.0.0.1:5432/shakepay_test npx sequelize db:migrate:undo && cd -"

alias sdockerbuild="docker-compose -f ./docker-compose.test.yml build --no-cache"

# AWS
# cloudwatch
alias slogs="AWS_VAULT_PROMPT=ykman aws-vault login qa"

# build shaekapy android on physical device
alias sandroid="ENVFILE=.env.qa2 react-native run-android --variant QaDebug --appIdSuffix qa"
# reset build after rebasing to master
alias sbuild="npm run clean && npm run build && npm run build-ci"
# run quotes
alias squote="LIGHTSHIP_PORT=5009 npm run -w apps/backend cronjob updateQuote"

# AWS
alias sp-logs="/Users/richardjarram/code/shakepay/shell-scripts/sp-logs.sh"

# NPM
alias snpm="npm run -w"

# shakepay direct deposits
alias ddqa="sftp -i ~/.ssh/shakepay-qa-pt-sftp-private-key ptrust@s-97a60984a87a41b6b.server.transfer.ca-central-1.amazonaws.com"
alias ddqa2="sftp -i ~/.ssh/shakepay-qa-pt-sftp-private-key ptrust@s-97a60984a87a41b6b.server.transfer.ca-central-1.amazonaws.com"

# shakepay AWS aliases
getsecret() {
    if [[ -z "${1}" ]]; then
        echo "Please provide the secret ID as an argument."
        return 1
    fi
    
    aws secretsmanager get-secret-value --secret-id "${1}" --query SecretString
}

alias listsecrets="aws secretsmanager list-secrets"

# direnv
alias envqa="export DEV_ENV=QA; direnv allow $(pwd)"
alias envqa2="export DEV_ENV=QA2; direnv allow $(pwd)"
alias envtest="export DEV_ENV=test; direnv allow $(pwd)"

alias pqa="git push origin head:qa -f"
alias pqa2="git push origin head:qa2 -f"

# k8s contexts
alias kqa="kctxt qa"
alias kqa2="kctxt qa2"

# jump scripts
alias qa_main="AWS_VAULT_PROMPT=ykman aws-vault exec qa -- kdb"
alias qa_reporting="AWS_VAULT_PROMPT=ykman aws-vault exec qa -- kdb reporting"

alias qa2_main="AWS_VAULT_PROMPT=ykman aws-vault exec qa2 -- kdb"
alias qa2_reporting="AWS_VAULT_PROMPT=ykman aws-vault exec qa2 -- kdb reporting"

alias kdr="kdb reporting"

function shakepay_build_workspace() {
    if [ "$#" -eq 0 ]; then
        echo "Usage: shakepay_build_wokspace WORKSPACE [WORKSPACE...]"
        
        return 1
    fi
    
    for WORKSPACE in "$@"
    do
        npm run -w $WORKSPACE clean && npm run -w $WORKSPACE build && npm run -w $WORKSPACE build-ci
        
        if [ $? -ne 0 ]; then
            return 1
        fi
    done
}

alias sbw="shakepay_build_workspace"

function create_shaketh_tag() {
    qa_prefix=$1
    version_number=$2
    
    current_branch=$(git branch --show-current)
    tag="${qa_prefix}-${current_branch}-${version_number}"
    
    git tag $tag
    
    git push origin $tag
    
    echo "Successfully started new Cricle CI build for: ${tag}"
}

alias stag="create_shaketh_tag"
