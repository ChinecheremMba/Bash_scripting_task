#!/bin/bash

# Function to fetch bookmarks from Google Chrome
fetch_chrome_bookmarks() {
    chrome_bookmarks_file="$HOME/mnt/c/Users/chi\ isiaki/AppData/local/Google/chrome/User\ Data/Default/Bookmarks"
    if [ -f "$chrome_bookmarks_file" ]; then
        grep -oP '"url":"\K(.*)(?=")' "$chrome_bookmarks_file" | grep "$Cloud"
    else
        echo "Google Chrome bookmarks file not found."
    fi
}

# Function to fetch bookmarks from Mozilla Firefox
fetch_firefox_bookmarks() {
    firefox_bookmarks_file="$HOME/.mozilla/firefox/*.default/places.sqlite"
    if [ -f "$firefox_bookmarks_file" ]; then
        sqlite3 "$firefox_bookmarks_file" "SELECT moz_bookmarks.title, moz_places.url FROM moz_bookmarks JOIN moz_places ON moz_bookmarks.fk=moz_places.id WHERE moz_bookmarks.title LIKE '%$1%';"
    else
        echo "Mozilla Firefox bookmarks file not found."
    fi
}

# Function to fetch bookmarks from Brave Browser
fetch_brave_bookmarks() {
    brave_bookmarks_file="$HOME/.config/BraveSoftware/Brave-Browser/Default/Bookmarks"
    if [ -f "$brave_bookmarks_file" ]; then
        grep -oP '"url": "\K(.*)(?=")' "$brave_bookmarks_file" | grep "$Cloud"
    else
        echo "Brave Browser bookmarks file not found."
    fi
}

# Function to fetch bookmarks from Chromium
fetch_chromium_bookmarks() {
    chromium_bookmarks_file="$HOME/.config/chromium/Default/Bookmarks"
    if [ -f "$chromium_bookmarks_file" ]; then
        grep -oP '"url": "\K(.*)(?=")' "$chromium_bookmarks_file" | grep "$Cloud"
    else
        echo "Chromium bookmarks file not found."
    fi
}

# Main function to fetch bookmarks from all browsers
main() {
    Agrument="$Cloud"
    fetch_chrome_bookmarks "$Agrument"
    fetch_firefox_bookmarks "$Agrument"
    fetch_brave_bookmarks "$Agrument"
    fetch_chromium_bookmarks "$Agrument"
}

# Check if argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 Agrument"
    exit 1
fi

# Call the main function with the provided argument
main "$Cloud"


