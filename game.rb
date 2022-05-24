# Create a class to represent each player and their attributes
class Player
  @@player_total = 0
  # Make a way to get and set the token and moves for each player
  attr_accessor :marker, :moves, :winner
  attr_reader :name

  def initialize(name)
    @name = name
    @@player_total += 1
    @moves = []
    @winner = false
  end
end

# Create a class to represent the game board
class Board
  attr_reader :winning_combinations
  attr_accessor :board_values

  def initialize
    @board_values = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    # Create a hash to store all winning combos
    @winning_combinations = {
      top_row: [1, 2, 3],
      middle_row: [4, 5, 6],
      bottom_row: [7, 8, 9],
      first_column: [1, 4, 7],
      second_column: [2, 5, 8],
      third_column: [3, 6, 9],
      first_diagonal: [1, 5, 9],
      second_diagonal: [3, 5, 7]
    }
  end

  def display_board
    puts
    puts " #{@board_values[0]} | #{@board_values[1]} | #{@board_values[2]} "
    puts '---+---+---'
    puts " #{@board_values[3]} | #{@board_values[4]} | #{@board_values[5]} "
    puts '---+---+---'
    puts " #{@board_values[6]} | #{@board_values[7]} | #{@board_values[8]} "
    puts
  end

  def set_value(value, marker)
    @board_values[value - 1] = marker
  end
end

# Create a function to set the marker for each player
def create_marker(player)
  puts 'Please enter the letter (or special character) that you want as your game marker!'
  marker = gets.chomp
  # If the user input is longer than one character, have them redo their inputs and reset the marker
  while marker.length > 1
    puts 'Your marker must only be ONE character! Please try again!'
    marker = gets.chomp
  end
  # Set the player marker
  player.marker = marker
end

# Make a function to create players at the beginning of the game
def create_player(player_number)
  puts "Enter the name of Player #{player_number}:"
  name = gets.chomp
  # Create the player instance using the Player class
  player = Player.new(name)
  create_marker(player)
  player
end

def make_move(player, board)
  # Display board
  board.display_board
  # Ask for player's input 
  puts "#{player.name}, choose a spot on the board to place your marker!"
  player_choice = gets.chomp.to_i
  # Until their input is valid, keep asking them to choose a spot
  until player_choice == board.board_values[player_choice - 1]
    puts "#{player.name}, please choose a valid spot on the board!"
    player_choice = gets.chomp
  end
  # Store the value they choose in an array that holds all their moves
  player.moves.push(player_choice)
  # Replace the value on the board with the player's token
  board.board_values[player_choice - 1] = player.marker
  # Compare the player's moves array to all of the possible winning combos
  winning_combos = board.winning_combinations
  winning_combos.each do |key, combo|
    matched_moves = player.moves.intersection(combo)
    # If the array matches up with any of the winning combos, declare the current player as the winner
    if matched_moves.sort == combo
      puts "Congrats #{player.name}! You win!!"
      player.winner = true
    end
  end
end

# Starts the game
def game
  puts 'Welcome to the game of TicTacToe!'
  player1 = create_player(1)
  player2 = create_player(2)
  # Instantiate the board
  board = Board.new
  winner_declared = false
  until winner_declared == true
    make_move(player1, board)
    if player1.winner == true
      winner_declared = true
    else
      make_move(player2, board)
      winner_declared = player2.winner ? true : false
    end
  end
end

game
