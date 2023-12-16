#!/bin/bash

commands=("ls" "pwd" "cd" "cp" "mv" "rm" "mkdir" "rmdir" "cat" "echo" "grep" "chmod" "man" "ps" "kill")

function play_game() {
    current_command=${commands[$((RANDOM % ${#commands[@]}))]}

    echo -e "Welcome to the Linux Command Game!\nGuess the Linux command based on its description:\n\nDescription: ${descriptions[$current_command]}"
    read -p "Your guess: " user_guess

    if [[ "$user_guess" == "exit" ]]; then
        quit_game
    fi

    if [[ "$user_guess" == "$current_command" ]]; then
        echo -e "\nCongratulations! Your guess is correct."
    else
        echo -e "\nOops! The correct command is '$current_command'."
    fi

    play_game
}

function quit_game() {
    echo "Exiting the Linux Command Game. Goodbye!"
    exit 0
}

declare -A descriptions=(
    ["ls"]="List directory contents"
    ["pwd"]="Print working directory"
    ["cd"]="Change directory"
    ["cp"]="Copy files or directories"
    ["mv"]="Move or rename files or directories"
    ["rm"]="Remove files or directories"
    ["mkdir"]="Create a directory"
    ["rmdir"]="Remove an empty directory"
    ["cat"]="Concatenate and display the content of files"
    ["echo"]="Display a message or variable"
    ["grep"]="Search for a pattern in a file"
    ["chmod"]="Change file permissions"
    ["man"]="Display manual pages for a command"
    ["ps"]="List information about running processes"
    ["kill"]="Terminate or signal processes"
)

play_game
