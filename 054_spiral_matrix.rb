require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_054
    assert_equal [1, 2, 3, 6, 9, 8, 7, 4, 5],
                 spiral_order([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    assert_equal [2, 5, 4, -1, 0, 8],  spiral_order([[2, 5], [8, 4], [0, -1]])
    assert_equal [1, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 10, 9, 8, 7, 6, 5,
                  4, 3, 2],
                 spiral_order([[1, 11], [2, 12], [3, 13], [4, 14], [5, 15],
                               [6, 16], [7, 17], [8, 18], [9, 19], [10, 20]])
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8],
                 spiral_order([[1], [2], [3], [4], [5], [6], [7], [8]])
  end
end

# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  return [] if matrix.length.zero? || matrix[0].length.zero?
  return matrix[0] if matrix.length == 1
  return matrix.map(&:first) if matrix[0].length == 1

  first = matrix[0][0...-1]
  second = matrix[0...-1].map(&:last)
  third = matrix[-1][1..-1]
  fourth = matrix[1..-1].map(&:first)

  outer = first + second + third.reverse + fourth.reverse
  inner = matrix[1...-1].map { |line| line[1...-1] }

  outer + spiral_order(inner)
end
