#!/bin/bash

# Function to extract bookmarks from Chrome
extract_chrome_bookmarks() {
    local bookmarks_file="$HOME/.config/google-chrome/Default/Bookmarks"
    jq -r --arg keyword "$1" '.roots | .. | objects | select(.url | contains($keyword)) | .name + ": " + .url' "$bookmarks_file"
}

# Function to extract bookmarks from Firefox
extract_firefox_bookmarks() {
    local bookmarks_file="$HOME/.mozilla/firefox/*.default-release/places.sqlite"
    sqlite3 "$bookmarks_file" "SELECT title, url FROM moz_places WHERE title LIKE '%$1%' OR url LIKE '%$1%';"
}

# Function to extract bookmarks from Brave Browser
extract_brave_bookmarks() {
    local bookmarks_file="$HOME/.config/BraveSoftware/Brave-Browser/Default/Bookmarks"
    jq -r --arg keyword "$1" '.roots | .. | objects | select(.url | contains($keyword)) | .name + ": " + .url' "$bookmarks_file"
}

# Function to extract bookmarks from Chromium
extract_chromium_bookmarks() {
    local bookmarks_file="$HOME/.config/chromium/Default/Bookmarks"
    jq -r --arg keyword "$1" '.roots | .. | objects | select(.url | contains($keyword)) | .name + ": " + .url' "$bookmarks_file"
}

# Main function
main() {
    if [ -z "$1" ]; then
        echo "Bookmark bar"
        exit 1
    fi

    echo "Chrome Bookmarks:"
    extract_chrome_bookmarks "$1"

    echo -e "\nFirefox Bookmarks:"
    extract_firefox_bookmarks "$1"

    echo -e "\nBrave Bookmarks:"
    extract_brave_bookmarks "$1"

    echo -e "\nChromium Bookmarks:"
    extract_chromium_bookmarks "$1"
}

# Run main function with keyword passed to the script
main "$@"
