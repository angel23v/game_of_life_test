# frozen_string_literal: false

require_relative 'count'

# class for change cells
class Cells < Count
  def initialize(width, height, fig)
    super
    @width = width
    @height = height
    @fig = fig
    @matrix = start_matrix(@height, @width)
    @flag = 0
  end

  def cell_alive(counted_nghbrs, jdx, idx, new_matrix, try_alive)
    if try_alive && counted_nghbrs == 2 || counted_nghbrs == 3
      new_matrix = new_matrix[jdx][idx][@flag] = '██'
    else
      new_matrix[jdx][idx][@flag] = '░░'
    end
    new_matrix
  end

  def cell_dead(new_matrix, counted_nghbrs, jdx, idx)
    new_matrix[jdx][idx][@flag] = '██' if counted_nghbrs == 3 && @matrix[jdx][idx][@flag] == '░░'
  end

  def change_cell(neighbours, new_matrix)
    (0...@width).each do |i|
      (0...@height).each do |j|
        counted_nghbrs = rules(@matrix, j, i, neighbours)

        try_alive = @matrix[j][i][@flag] == '██'

        cell_alive(counted_nghbrs, j, i, new_matrix, try_alive)

        cell_dead(new_matrix, counted_nghbrs, j, i)
      end
    end
    new_matrix
  end
end
