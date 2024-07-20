#!/bin/bash
download() {
    local url=""
    local filename=""
    
    while [ "$#" -gt 0 ]; do
        case "$1" in
            -u) url="$2"; shift 2;;
            -f) filename="$2"; shift 2;;
            *) echo "Unknown parameter: $1"; exit 1;;
        esac
    done
    
    if [ -z "$url" ] || [ -z "$filename" ]; then
        echo "Usage: download -u <url> -f <filename>" >&2
        exit 1
    fi
    
    curl -s "$url" | lynx -dump -stdin > "$filename"
}

compress_mov() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 path_to_mov"
        exit 1
    fi
    
    input_path="$1"
    dir_path=$(dirname "$input_path")
    file_name=$(basename "$input_path" .mov)
    
    output_path="${dir_path}/${file_name}.mp4"
    
    ffmpeg -i "$input_path" -vcodec libx264 -crf 28  "$output_path"
    
    echo "Output saved to $output_path"
}

compress_pdf() {
    original_file_path="$1"
    output_file_path="${original_file_path%.pdf}_compressed.pdf"
    
    /opt/homebrew/bin/gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 \
    -dPDFSETTINGS=/screen \
    -dColorImageResolution=100 -dColorImageDownsampleType=/Bicubic \
    -dGrayImageResolution=100 -dGrayImageDownsampleType=/Bicubic \
    -dMonoImageResolution=100 -dMonoImageDownsampleType=/Subsample \
    -dNOPAUSE -dBATCH \
    -sOutputFile="$output_file_path" "$original_file_path"
}

get_last_commit_url() {
    if [ -n "$1" ]; then
        cd "$1" || exit 1
    fi
    
    last_commit_hash=$(git log -1 --format="%H")
    
    if [ -z "$last_commit_hash" ]; then
        echo "Failed to retrieve the last commit hash."
        exit 1
    fi
    
    url="https://github.com/shakepay/shake-hosted-wallet/pull/7486/commits/$last_commit_hash"
    
    formatted_url="[$last_commit_hash]($url)"
    
    echo -n "$formatted_url" | pbcopy;
    
    printf "🪄 Copied to clipboard! 📋\n$url"
}

resim_reset() {
    resim reset
    
    output=$(resim new-account)
    
    account_address=$(echo "$output" | grep "Account component address:" | awk '{print $NF}')
    private_key=$(echo "$output" | grep "Private key:" | awk '{print $NF}')
    owner_badge=$(echo "$output" | grep "Owner badge:" | awk '{print $NF}')
    
    # Print extracted information
    echo "New account created:"
    echo "Account Address: $account_address"
    echo "Private Key: $private_key"
    echo "Owner Badge: $owner_badge"
    
    # Set the new account as default
    resim set-default-account $account_address $private_key $owner_badge
    
    echo "New account set as default."
}

resim_ideosphere_setup() {
    # Publish the package
    package_address=$(resim publish . | grep -o 'package_sim\w*')
    echo "Package published at: $package_address"
    echo "\n\n"
    
    # Instantiate the Platform
    platform_component=$(resim call-function $package_address Platform instantiate | grep -o 'component_sim\w*' | sort | uniq )
    echo "Platform component created at: $platform_component"
    echo "\n\n"
    
    # Create sponsor wallet
    sponsor_wallet=$(resim call-method $platform_component create_sponsor_wallet | grep -o 'component_sim\w*' | sort | uniq )
    echo "Sponsor wallet created at: $sponsor_wallet"
    echo "\n\n"
    
    # Create patron wallet
    patron_wallet=$(resim call-method $platform_component create_patron_wallet | grep -o 'component_sim\w*' | sort| uniq )
    echo "Patron wallet created at: $patron_wallet"
    echo "\n\n"
    
    # # Deposit money into sponsor wallet
    # xrd_resource="resource_sim1tknxxxxxxxxxradxrdxxxxxxxxx009923554798xxxxxxxxxakj8n3"
    # sponsor_badge="resource_sim1ngujp6stqy6jnwcv6el9hu9hzne39y870wkyxj4jsnl2s9jpvardat"
    # nft_ruid="35adc890d2a02565-0348ca2795f22bae-b3794e65d2b3b67b-d69e8b21e4899bdd"
    # resim call-method $sponsor_wallet deposit $xrd_resource:100 --proofs $sponsor_badge:{$nft_ruid}
    # echo "Deposited 100 XRD into sponsor wallet"
    
    # # Make subscription
    # resim call-method $sponsor_wallet subscribe $patron_wallet 50 --proofs $sponsor_badge:{$nft_ruid}
    # echo "Created subscription"
    
    # # Pay subscriptions
    # resim call-method $sponsor_wallet pay_subscription
    # echo "Paid subscriptions"
    
    # # Delete subscription
    # subscription_nft="35b775d33588cf0e-2cfb2b3d51e6cbe0-af93f91864279138-37cbceec6f3c2cbb"
    # resim call-method $sponsor_wallet cancel_subscription $subscription_nft --proofs $sponsor_badge:{$nft_ruid}
    # echo "Cancelled subscription"
    
    # # Withdraw money from sponsor vault
    # resim call-method $sponsor_wallet withdraw 1 --proofs $sponsor_badge:{$nft_ruid}
    # echo "Withdrew 1 XRD from sponsor wallet"
}
