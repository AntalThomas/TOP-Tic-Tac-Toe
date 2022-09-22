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
  for line in winning_combo
    won = line.all? { |num| num == "X" }
    if won == true
      puts "\n#{user_name} has won the game!\n"
      display_board(board)
      exit(0)
    end

    won = line.all? { |num| num == "Y" }
    if won == true
      puts "\n#{user_name} has won the game!\n"
      display_board(board)
      exit(0)
    end
  end
end

def check_drawn_game(board, original_board)
  drawn = 0

  board.each_with_index do |tile, index|
    board[index] != original_board[index] ? drawn += 1 : next
  end

  if drawn == 9
    puts "\nThe game is DRAWN!\n"
    display_board(board)
    exit(0)
  end
end

def game(board, original_board)
  # Gets player1 and player2 username
  puts "What is Player Ones username:"
  player1 = gets.chomp.upcase
  puts "\nWhat is Player Twos username:"
  player2 = gets.chomp.upcase

  puts "\n#{player1} and #{player2} are playing Tic-Tac-Toe today"
  
  # Plays until a player has won the round or drawn
  while true
    # Displays current board configuation
    display_board(board)

    # Gets player ones input
    puts "What tile does #{player1} pick:"
    player1_choice = gets.chomp.to_i
    puts ""

    # Updates board with player ones input
    update_board(board, "X", player1_choice)

    # Checks for a winning line for player one
    check_winning_line(board, player1)

    # Checks for a drawn game
    check_drawn_game(board, original_board)

    # Displays updated board
    puts ""
    display_board(board)

    # Gets player twos input
    puts "What tile does #{player2} pick:"
    player2_choice = gets.chomp.to_i
    puts ""

    # Updates and displays board with player twos input
    update_board(board, "Y", player2_choice)

    # Checks for a winning line for player two
    check_winning_line(board, player2)
  end
end

original_board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
game_board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
## REMEMBER TO - 1 FROM USER INPUT FOR CORRECT INDEXING

game(game_board, original_board)

# update_board(game_board, "player1", 1)
# update_board(game_board, "player3", 2)
# update_board(game_board, "player1", 3)
# update_board(game_board, "player2", 4)
# update_board(game_board, "player5", 5)
# update_board(game_board, "player2", 6)
# update_board(game_board, "player1", 7)
# update_board(game_board, "player2", 8)
# update_board(game_board, "player5", 9)

# display_board(game_board)

# check_drawn_game(game_board, original_board)