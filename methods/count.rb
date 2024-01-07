# frozen_string_literal: false

require_relative 'display'

# class for change cells
class Count < Display
  def initialize(width, height, fig)
    super
    @width = width
    @height = height
    @fig = fig
    @matrix = start_matrix(@height, @width)
    @flag = 0
  end

  def first_range(matrix, jdx, idx, neighbours, positions)
    condition = idx + 1 < matrix.length

    positions.each do |pos|
      neighbours += 1 if jdx + 1 < matrix.length && condition && matrix[jdx + 1][pos][@flag] == '██'
      neighbours += 1 if condition && matrix[jdx - 1][pos][@flag] == '██'
    end
    neighbours
  end

  def rules(matrix, jdx, idx, neighbours)
    positions = [idx, idx + 1, idx - 1]

    neighbours += first_range(matrix, jdx, idx, neighbours, positions)

    if idx + 1 < matrix.length
      neighbours += 1 if matrix[jdx][positions[2]][@flag] == '██'
      neighbours += 1 if matrix[jdx][positions[1]][@flag] == '██'
    end
    neighbours
  end
end
