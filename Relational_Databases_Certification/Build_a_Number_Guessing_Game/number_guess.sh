#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Prompt for username
echo "Enter your username:"
read USERNAME

# Get user info from database
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]]
then
  # New user - insert into database
  INSERT_RESULT=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, NULL)")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # Returning user
  echo "$USER_INFO" | while IFS='|' read GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

# Start the guessing game
echo "Guess the secret number between 1 and 1000:"
GUESSES=0

while true
do
  read GUESS

  # Check if input is an integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Increment guess count
  GUESSES=$(( GUESSES + 1 ))

  if [[ $GUESS -eq $SECRET_NUMBER ]]
  then
    echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done

# Update user stats
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
NEW_GAMES=$(( GAMES_PLAYED + 1 ))

if [[ -z $BEST_GAME ]] || [[ $GUESSES -lt $BEST_GAME ]]
then
  UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$NEW_GAMES, best_game=$GUESSES WHERE username='$USERNAME'")
else
  UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$NEW_GAMES WHERE username='$USERNAME'")
fi
