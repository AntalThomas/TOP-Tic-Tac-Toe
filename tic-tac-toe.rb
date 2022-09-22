board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
## REMEMBER TO - 1 FROM USER INPUT FOR CORRECT INDEXING

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]}\n "
end

def update_board(board, user_name, user_input)
  board[user_input - 1] = user_name

  puts "Player #{user_name} chose board number #{user_input}"
  display_board(board)
end

def winning_line(board, user_name)
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
    return won ? "Player #{user_name} has won the game!" : next
  end
end
  

puts "Fresh Board"
display_board(board)

puts "Updated Board"
update_board(board, "X", 1)

puts "Updated Board"
update_board(board, "X", 4)

puts "Updated Board"
update_board(board, "X", 7)

winning_line(board, "X")