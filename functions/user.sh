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

get_last_commit_url() {
    if [ -n "$1" ]; then
        cd "$1" || exit 1 # Exit if the directory does not exist
    fi
    
    last_commit_hash=$(git log -1 --format="%H")
    
    if [ -z "$last_commit_hash" ]; then
        echo "Failed to retrieve the last commit hash."
        exit 1
    fi
    
    url="https://github.com/shakepay/shake-hosted-wallet/pull/7486/commits/$last_commit_hash"
    
    formatted_url="[$last_commit_hash]($url)"
    
    echo -n "$formatted_url" | pbcopy;
    
    echo "🪄 [$url] copied to clipboard! 📋"
}
