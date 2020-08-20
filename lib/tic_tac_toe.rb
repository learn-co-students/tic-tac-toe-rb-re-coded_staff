WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
end
def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(board, index, current_player)
    board[index] = current_player
  end
  
  def position_taken?(board, location)
    board[location] != " " && board[location] != ""
  end
  
  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
  end
  
def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
        move(board, index, current_player(board))
        display_board(board)
    else
        turn(board)
    end
end

def turn_count(board)
    board.count { |token| token == 'X' || token == 'O' }
end
def current_player(board)
    turns = turn_count(board)
    turns.even? ? "X" : "O"
end
def won?(board)
    WIN_COMBINATIONS.detect do |win|
      board[win[0]] == board[win[1]] &&
      board[win[1]] == board[win[2]] &&
      position_taken?(board, win[0])
    end
end

def full?(board)
    board.all? do |index|
        index == "X" || index == "O"
    end
end

def draw?(board)
    !won?(board) && full?(board)
end

def over?(board)
    won?(board) || draw?(board)
end

def winner(board)
    won?(board) ? board[won?(board)[0]] : nil
end
# Define your play method below
def play(board)
    while !over?(board)
        turn(board) 
    end 
    if draw?(board)
        puts "Cat's Game!"
    else
        puts "Congratulations #{winner(board)}!"
    end
  end