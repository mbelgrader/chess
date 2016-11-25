require "colorize"
require_relative "cursor"

class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    system('clear')
    show
  end

  def get_cursor
    @cursor.get_input
  end

  def show
    @board.grid.each_with_index do |line, row_idx|
      line.each_with_index do |piece, col_idx |
        if [row_idx, col_idx] == @cursor.cursor_pos
          print piece.to_s.colorize(:background => :blue) + " | "
        else
          print piece.to_s + ' | '
        end
      end
      puts
    end
  end

end
