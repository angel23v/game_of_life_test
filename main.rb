# frozen_string_literal: false

#  '██' '░░'

require_relative './methods/cells'

# game of life
class Game < Cells
  attr_accessor(:width, :height, :fig)

  def initialize(width, height, fig)
    super
    @width = width
    @height = height
    @fig = fig
    @matrix = start_matrix(@height, @width)
    @flag = 0
  end

  def start_matrix(height, width)
    matrix = Array.new(height) { Array.new(width) }

    (0...width).each do |i|
      (0...height).each do |j|
        matrix[j][i] = ['░░', '░░']
      end
    end
    matrix
  end

  def print_fig
    @fig.each do |arr|
      @matrix[arr[0]][arr[1]][@flag] = '██'
    end
  end
end

f = [
  [5, 4],
  [5, 3],
  [3, 3],
  [3, 4],
  [4, 3],
  [4, 5],
  [3, 5],
  [4, 5],
  [5, 5]
]

a = Game.new(10, 10, f)
a.print_fig
a.display
