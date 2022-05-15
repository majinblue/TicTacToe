# In the game of TicTacToe, there's only two players, two tokens, and one board.
# Create a class to represent each player and their attributes
class Player
  # Make a way to get and set the token for each player
  attr_accessor :marker

  def initialize(name)
    @name = name
  end
end

# I want the board to be displayed like below, but I don't want to keep repeating myself in my code
# puts " 1 | 2 | 3 "
# puts "---+---+---"
# puts " 4 | 5 | 6 "
# puts "---+---+---"
# puts " 7 | 8 | 9 "
class Board
  attr_accessor :board

  def initialize
    @board = [1,2,3,4,5,6,7,8,9]
  end

  def display_board
    puts
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts '---+---+---'
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts '---+---+---'
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
    puts
  end
end

# The current flow of the program goes like this:
# Ask player one for their name
# Create a new player object using their name
# Ask the player what token they prefer to use
# If their input is something greater than one character, let the user know and have them retry
# If the token they choose is appropriate, store it in their player object
# Repeat the above for player two
# Instantiate the game board
# Ask current player to choose a spot on the game board that isn't already selected
# Store their token in the selected spot
# Update the board to show which spots have been used
# Repeat the process with the next player

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
  # Set the marker for the player
  create_marker(player)
  player
end

def game
  puts 'Welcome to the game of TicTacToe!'
  # Create players one and two
  player1 = create_player(1)
  player2 = create_player(2)
  # Instantiate the board
end

game
