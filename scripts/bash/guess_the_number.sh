#! /bin/bash

# generate a random number between 1 and 100
generate_random_number ()
{
  random_nu=$(( (RANDOM % $1) + 1 ))
  echo $random_nu
}

select_mode () {

  while true
  do
    read -p "Select mode: (1.Easy 2.Medium 3.Hard) " mode

    case "$mode" in
      "1")
        echo 10
        echo -n "Game Mode: Easy, " >> game_history.txt
        return 0
        ;;
      "2")
        echo 50
        echo -n "Game Mode: Medium, " >> game_history.txt
        return 0
        ;;
      "3")
        echo 1000
        echo -n "Game Mode: Hard, " >> game_history.txt
        return 0
        ;;
    esac
  done

}

game_setup () {
  local guess="$1"
  local i=0  # tries

  while True
  do
    read -p "Guess The Number: " user_guess
    ((i++))
    if [ "$guess" == "$user_guess"  ]; then
      echo "You won in ${i} tries!"
      echo "Won In ${i} Tries" >> game_history.txt
      break
    elif [ "$user_guess" -gt "$guess" ]; then
      echo "It's less than $user_guess"
      continue
    else
      echo "It's greater than $user_guess"
      continue
    fi
  done
}

play_game () {
  results=$(select_mode)
  num=$(generate_random_number $results)
  echo -n "Guess Number: ${num}, " >> "game_history.txt"
  game_setup $num                       
}

start_game () {
  player_name=$1

  if ! [ -e "./game_history.txt" ]; then
        touch game_history.txt
  fi

  echo -e "\nPlayer Name: ${player_name}" >> game_history.txt

  play_game

  while True
  do
    read -p "Wanna play again? y/n " play_again
    if [ "$play_again" == "y" ]; then
      play_game
    else
      echo "Goodbye ${player_name}"
      break
    fi
  done
}

game_menu () {
  p_name=$1
  while True; do
    read -p $'1.Play game  2.Show Player Stats  3.Quit \n' option
    case "$option" in 
      "1")
        start_game $p_name
        return 0
        ;;
      "2")
        echo "Player stats comming soon"
        return 0
        ;;
      "3")
        return 0
        ;;
        esac
        done
}

read -p "Hello, what is your name? " NAMEVAR
echo "Hello, ${NAMEVAR}. Welcome to Guess The Number Game!"

game_menu $NAMEVAR


