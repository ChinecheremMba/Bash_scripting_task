# Bash_scripting_task
In this project we will be building a Bash Script that will fetch all the bookmarks from all the major browsers (Google Chrome, Mozilla Firefox, Brave Browser and Chromium) on your system and filter only those that will contain a particular word which we can provide as an argument while running the script

##### Step 1
To do this you need to install some dependance if you don't already have them 
###### linux users
sudo apt install -y jq (for jason)
sudo apt install -y sqlite3
sudo apt install -y grep
 
window users can use their respective page for download. 
###### JQ
jq is a lightweight and flexible command-line JSON processor. It allows you to parse, manipulate, and extract data from JSON files in a Unix-like command-line environment.

we use json because chrome, brave, and chromium stores book in json formate. 

###### SQlite3 
SQLite is a lightweight, self-contained, serverless, transactional SQL database engine. sqlite3 is a command-line interface (CLI) to interact with SQLite databases. SQLite is popular because it's fast, reliable, and widely used in various applications and embedded systems due to its simplicity and efficiency. firefox stores bookmark in SQL formate.

##### Step 2 
write a function to fetch the bookmarks
- define the partway
- write a conditonal statement 
The conditional should be able to 
- check if the file exist 
- get the urls
- out the provided argument using grep

##### Step 3
Write the main functions. This function takes the argument and calls the other functions. 

##### Step 4 
Write a conditional statement that checks whether an argument is provided or not 

##### Step 5 
Run your code. 

### Note 
My chrome pathway was because I am on a window system using Ubuntu WSL. the default partway for linux users is 
".config/google-chrome/Default/Bookmarks"
