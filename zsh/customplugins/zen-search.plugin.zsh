# URL encode function using built-in tools
url_encode() {
    local string="$1"
    local encoded=""
    local pos c o
    
    for ((pos=0; pos < ${#string}; pos++)); do
        c=${string:$pos:1}
        case $c in
            [-_.~a-zA-Z0-9]) 
                encoded+="$c" 
                ;;
            *) 
                printf -v o '%%%02x' "'$c"
                encoded+="${o}" 
                ;;
        esac
    done
    echo "${encoded}"
}

# Zen  browser function
zen() {
    if [[ $# -eq 0 ]]; then
        open -a Zen\ Browser
        return
    fi
    search_query="$@"
    encoded_query=$(url_encode "$search_query")
    open -a Zen\ Browser "https://www.google.com/search?q=$encoded_query"
}

# Case variants
ZEN() { zen "$@" }
Zen() { zen "$@" }

# Add completion
_zen() {
    _arguments '*:search term'
}
compdef _zen zen
compdef _zen ZEN
compdef _zen Zen
