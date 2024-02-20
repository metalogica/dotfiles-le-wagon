#!/bin/bash
alias sbw="shakepay_build_workspace"
alias stag="create_shaketh_tag"
alias snr="shakepay_npm_run"

# simulators
alias iossmall="react-native run-ios --scheme \"Shaketh Debug\" --configuration \"Debug\" --simulator \"iPhone SE (2nd generation)\""

# run dev test in container (2)
alias stestfull="docker-compose -f /Users/richardjarram/code/shakepay/shake-hosted-wallet/docker-compose.test.yml run test"

# run async processor
alias sasync="PORT=5001 LIGHTSHIP_PORT=5005 npx nodemon -w apps/backend ./apps/backend/src/jobs/async-processor-consumer.js"
# run shake board in debug mode
alias sboard="npm run -w apps/backend dev-shakeboard"

# run backend in debug mode
alias sapi="npm run -w apps/backend dev"

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

