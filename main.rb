# frozen_string_literal: false

#  '██' '░░'

# game of life
class Game
  attr_accessor(:width, :height, :fig)

  def initialize(width, height, fig)
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

  def display
    @matrix.each do |i|
      i.each do |j|
        print j[@flag]
      end
      print "\n"
    end
    puts ''
  end

  def rules
    @fig.each do |arr|
      arr.each do |idx|
        @matrix[idx][idx][@flag] = '██'
      end
    end
  end

  # def insert_cells
  #   (0...@width).each do |i|
  #     (0...@height).each do |j|
  #       @matrix[j][i][@flag] = '██'
  #     end
  #   end
  # end
end

a = [
  [2, 2],
  [2, 3],
  [2, 4],
  [2, 5]
]

g = Game.new(7, 7, a)
# g.display

g.display
# g.insert_cells
g.rules
g.display
