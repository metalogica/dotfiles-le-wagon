#!/bin/bash
# run a single test
stest() {
    DATABASE_URL=postgres://postgres:@127.0.0.1:5432/shakepay_test DATABASE_URL_READONLY=postgres://postgres:@127.0.0.1:5432/shakepay_test DATABASE_URL_REPORTING=postgres://postgres:@127.0.0.1:5432/shakepay_reporting_test DATABASE_URL_REPORTING_READONLY=postgres://postgres:@127.0.0.1:5432/shakepay_reporting_test DATABASE_URL_MIGRATIONS=postgres://postgres:@127.0.0.1:5432/shakepay_test APP_TYPE=shakeboard LIGHTSHIP_PORT=5005 NODE_ENV=test TS_NODE_TRANSPILE_ONLY=true npx -w apps/backend mocha --config /Users/richardjarram/code/shakepay/shake-hosted-wallet/apps/backend/.mocharc.dev.json `echo "$1"`
}

# run devtest in test container
devtest() {
    DATABASE_URL=postgres://postgres:@127.0.0.1:5432/shakepay_test DATABASE_URL_READONLY=postgres://postgres:@127.0.0.1:5432/shakepay_test DATABASE_URL_REPORTING=postgres://postgres:@127.0.0.1:5432/shakepay_reporting_test DATABASE_URL_REPORTING_READONLY=postgres://postgres:@127.0.0.1:5432/shakepay_reporting_test DATABASE_URL_MIGRATIONS=postgres://postgres:@127.0.0.1:5432/shakepay_test APP_TYPE=shakeboard LIGHTSHIP_PORT=5005 NODE_ENV=test npm run -w apps/backend devmocha
}

# jump scripts
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

# shakepay AWS aliases
getsecret() {
    if [[ -z "${1}" ]]; then
        echo "Please provide the secret ID as an argument."
        return 1
    fi
    
    aws secretsmanager get-secret-value --secret-id "${1}" --query SecretString
}

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

function create_shaketh_tag() {
    qa_prefix=$1
    version_number=$2
    
    current_branch=$(git branch --show-current)
    tag="${qa_prefix}-${current_branch}-${version_number}"
    
    git tag $tag
    
    git push origin $tag
    
    echo "Successfully started new Cricle CI build for: ${tag}"
}
