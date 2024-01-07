# frozen_string_literal: false

require_relative 'cells'

# class for display
class Display
  def initialize(width, height, fig)
    @width = width
    @height = height
    @fig = fig
    @matrix = start_matrix(@height, @width)
    @flag = 0
  end

  def total_neighbours
    neighbours = 0
    new_matrix = start_matrix(@height, @width)
    @matrix = change_cell(neighbours, new_matrix)
  end

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
