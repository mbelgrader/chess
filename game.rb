require_relative 'board'
require_relative 'display'
require_relative 'player'

class Game
  attr_reader :board

  def initialize(player1, player2)
    @board = Board.new
    @display = Display.new(@board)
    @player1, @player2 = player1, player2
    @current_player = player1
  end

  def play
    @display.render
    puts "Enter space or enter to select a position."
    take_turn
  end

  def take_turn
    end_pos = 0
    while end_pos != nil
      start_pos = @display.cursor.get_input
      end_pos = @display.cursor.get_input
      board[end_pos] = board[start_pos]
      board[start_pos] = NullPiece.instance
      @display.render
    end
  end

  def switch_players!
    current_player = current_player == player1 ? player2 : player1
  end
end

if __FILE__ == $PROGRAM_NAME
  player1 = HumanPlayer.new("Garry", :white)
  player2 = HumanPlayer.new("Bob", :black)

  game = Game.new(player1, player2)
  game.play
end
