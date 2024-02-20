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
