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

  def print_fig
    @fig.each do |arr|
      @matrix[arr[0]][arr[1]][@flag] = '██'
    end
  end

  def rules(matrix, jdx, idx, neighbours)

    if jdx + 1 < matrix.length && idx + 1 < matrix.length
      neighbours += 1 if matrix[jdx + 1][idx][@flag] == '██'
      neighbours += 1 if matrix[jdx + 1][idx - 1][@flag] == '██'
      neighbours += 1 if matrix[jdx + 1][idx + 1][@flag] == '██'
    end

    if idx + 1 < matrix.length
      neighbours += 1 if matrix[jdx][idx - 1][@flag] == '██'

      neighbours += 1 if matrix[jdx][idx + 1][@flag] == '██'

      neighbours += 1 if matrix[jdx - 1][idx][@flag] == '██'

      neighbours += 1 if matrix[jdx - 1][idx - 1][@flag] == '██'

      neighbours += 1 if matrix[jdx - 1][idx + 1][@flag] == '██'
    end
      neighbours
  end

  def cell_alive
    cell = total_neighbours
    puts cell
  end

  def total_neighbours
    neighbours = 0

    (0...@width).each do |i|
      (0...@height).each do |j|
        if rules(@matrix, j, i, neighbours) == 2 || rules(@matrix, j, i, neighbours) == 3 && @matrix[j][i][@flag] == '██'
          @matrix[j][i][@flag] = '██'
        elsif rules(@matrix, j, i, neighbours) == 3 && @matrix[j][i][@flag] == '░░'
          @matrix[j][i][@flag] = '██'
        elsif rules(@matrix, j, i, neighbours) > 3 && @matrix[j][i][@flag] == '██'
          @matrix[j][i][@flag] = '░░'
        end
      end
    end
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
end

a = [
  [4, 1],
  [2, 2],
  [3, 2],
  [4, 2],
  [3, 4]
]

g = Game.new(7, 7, a)
# g.display
# g.insert_cells
g.print_fig

g.display

g.total_neighbours
g.display

g.total_neighbours
g.display

g.total_neighbours
g.display

g.total_neighbours
g.display

g.total_neighbours
g.display

g.total_neighbours
g.display
