# frozen_string_literal: true
require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_073
    m1 = [
      [1, 2, 3],
      [4, 0, 6],
      [7, 8, 9]
    ]

    r1 = [
      [1, 0, 3],
      [0, 0, 0],
      [7, 0, 9]
    ]
    set_zeroes(m1)

    assert_equal r1, m1
  end
end

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  return if matrix.length.zero?
  first_row_zero = false
  first_col_zero = false

  first_row_zero = true if matrix[0].reduce(:*).zero?
  first_col_zero = true if matrix.map { |line| line[0] }.reduce(:*).zero?

  1.upto(matrix.length - 1) do |i|
    1.upto(matrix[0].length - 1) do |j|
      if matrix[i][j].zero?
        matrix[0][j] = 0
        matrix[i][0] = 0
      end
    end
  end

  1.upto(matrix.length - 1) do |i|
    1.upto(matrix[0].length - 1) do |j|
      matrix[i][j] = 0 if matrix[0][j].zero? || matrix[i][0].zero?
    end
  end
  matrix[0].map! { 0 } if first_row_zero
  matrix.map { |line| line[0] = 0 } if first_col_zero
end
