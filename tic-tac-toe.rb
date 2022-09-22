class TicTacToe
  def initialize
    @original_board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @game_board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    # Gets player1 and player2 username
    puts "What is Player Ones username:"
    @player1 = gets.chomp.upcase
    puts "\nWhat is Player Twos username:"
    @player2 = gets.chomp.upcase

    puts "\n#{@player1} and #{@player2} are playing Tic-Tac-Toe today\n"
  end

  def display_board
    puts " #{@game_board[0]} | #{@game_board[1]} | #{@game_board[2]} "
    puts "-----------"
    puts " #{@game_board[3]} | #{@game_board[4]} | #{@game_board[5]} "
    puts "-----------"
    puts " #{@game_board[6]} | #{@game_board[7]} | #{@game_board[8]}\n "
  end

  def update_board(user_name, user_input)
    @game_board[user_input - 1] = user_name
  end

  def check_winning_line(user_name)
    winning_combo = [
      [@game_board[0], @game_board[1], @game_board[2]],
      [@game_board[3], @game_board[4], @game_board[5]],
      [@game_board[6], @game_board[7], @game_board[8]],
      [@game_board[0], @game_board[3], @game_board[6]],
      [@game_board[1], @game_board[4], @game_board[7]],
      [@game_board[2], @game_board[5], @game_board[8]],
      [@game_board[0], @game_board[4], @game_board[8]],
      [@game_board[2], @game_board[4], @game_board[6]]
    ]
    for line in winning_combo
      won = line.all? { |num| num == "X" }
      if won == true
        puts "#{user_name} has won the game!\n\n"
        display_board()
        exit(0)
      end

      won = line.all? { |num| num == "O" }
      if won == true
        puts "#{user_name} has won the game!\n\n"
        display_board(@game_board)
        exit(0)
      end
    end
  end

  def check_drawn_game
    drawn = 0

    @game_board.each_with_index do |tile, index|
      @game_board[index] != @original_board[index] ? drawn += 1 : next
    end

    if drawn == 9
      puts "\nThe game is a DRAW!\n\n"
      display_board()
      exit(0)
    end
  end

  def game
    # Plays until a player has won the round or drawn
    while true
      # Displays current board configuation
      display_board()

      # Gets player ones input
      puts "What tile does #{@player1} pick:"
      player1_choice = gets.chomp.to_i
      puts ""

      # Updates board with player ones input
      update_board("X", player1_choice)

      # Checks for a winning line for player one
      check_winning_line(@player1)

      # Checks for a drawn game
      check_drawn_game()

      # Displays updated board
      puts ""
      display_board()

      # Gets player twos input
      puts "What tile does #{@player2} pick:"
      player2_choice = gets.chomp.to_i
      puts ""

      # Updates and displays board with player twos input
      update_board("O", player2_choice)

      # Checks for a winning line for player two
      check_winning_line(@player2)
    end
  end


  ## REMEMBER TO - 1 FROM USER INPUT FOR CORRECT INDEXING
end

# game(game_board, original_board)

testing = TicTacToe.new()
testing.game