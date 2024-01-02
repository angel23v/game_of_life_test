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

  def total_neighbours
    neighbours = 0
    new_matrix = start_matrix(@height, @width)

    (0...@width).each do |i|
      (0...@height).each do |j|
        counted_nghbrs = rules(@matrix, j, i, neighbours)
        if (counted_nghbrs == 2 || counted_nghbrs == 3) && @matrix[j][i][@flag] == '██'
          new_matrix[j][i][@flag] = '██'
        elsif counted_nghbrs == 3 && @matrix[j][i][@flag] == '░░'
          new_matrix[j][i][@flag] = '██'
        elsif (counted_nghbrs > 3 || counted_nghbrs < 2) && @matrix[j][i][@flag] == '██'
          new_matrix[j][i][@flag] = '░░'
        end
      end
    end
    @matrix = new_matrix
  end

  # def total_neighbours
  #   neighbours = 0
  #   new_matrix = start_matrix(@height, @width)

  #   (0...@width).each do |i|
  #     (0...@height).each do |j|
  #       counted_nghbrs = rules(@matrix, j, i, neighbours)
  #       change_cell(new_matrix, counted_nghbrs, j, i)

  #       if @matrix[j][i][@flag] == '░░' && counted_nghbrs == 3
  #           new_matrix[j][i][@flag] = '██'
  #       end
  #    end
  #   end
  #   @matrix = new_matrix
  # end

  # def change_cell(new_matrix, counted_nghbrs, jdx, idx)

  #   condition = counted_nghbrs > 3 || counted_nghbrs < 2
  #   condition2 = counted_nghbrs == 3 || counted_nghbrs == 2

  #   new_matrix[jdx][idx][@flag] = '██' if @matrix[jdx][idx][@flag] == '██' && (condition)
  #   new_matrix[jdx][idx][@flag] = '░░' if @matrix[jdx][idx][@flag] == '██' && (condition2)
  # end

  def wait_sleep
    sleep(1)
    total_neighbours
  end

  def display
    loop do
      @matrix.each do |i|
        i.each do |j|
          print j[@flag]
        end
        print "\n"
      end
      puts ''
      wait_sleep
    end
  end
end

a = [
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

g = Game.new(10, 10, a)
g.print_fig

g.display
