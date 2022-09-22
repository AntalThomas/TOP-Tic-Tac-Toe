def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]}\n "
end

def update_board(board, user_name, user_input)
  board[user_input - 1] = user_name
end

def check_winning_line(board, user_name)
  gameOver = false
  winning_combo = [
    [board[0], board[1], board[2]],
    [board[3], board[4], board[5]],
    [board[6], board[7], board[8]],
    [board[0], board[3], board[6]],
    [board[1], board[4], board[7]],
    [board[2], board[5], board[8]],
    [board[0], board[4], board[8]],
    [board[2], board[4], board[6]]
  ]
  for line in winning_combo do
    won = line.all? { |num| num == user_name }

    if won == true
      puts "\n#{user_name} has won the game!\n"
      display_board(board)
      exit(0)
    end
  end
end

def game(board)
  gameOver = false
  # Gets player1 and player2 username
  puts "What is Player Ones username:"
  player1 = gets.chomp.upcase
  puts "\nWhat is Player Twos username:"
  player2 = gets.chomp.upcase

  puts "\n#{player1} and #{player2} are playing Tic-Tac-Toe today"
  # Plays until a player has won the round or a draw
  while gameOver == false do
    # Displays current board configuation
    display_board(board)

    # Gets player ones input
    puts "What tile does #{player1} pick:"
    player1_choice = gets.chomp.to_i
    puts ""

    # Updates board with player ones input
    update_board(board, player1, player1_choice)

    # Checks for a winning line for player one
    check_winning_line(board, player1)

    # Displays updated board
    puts ""
    display_board(board)

    # Gets player twos input
    puts "What tile does #{player2} pick:"
    player2_choice = gets.chomp.to_i
    puts ""

    # Updates and displays board with player twos input
    update_board(board, player2, player2_choice)

    # Checks for a winning line for player two
    check_winning_line(board, player2)
  end
end

game_board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
## REMEMBER TO - 1 FROM USER INPUT FOR CORRECT INDEXING

game(game_board)