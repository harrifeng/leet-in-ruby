require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_074
    assert search_matrix([[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 50]], 3)
    assert search_matrix([[1], [3], [5]], 5)
  end
end

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  return false if matrix.length.zero?
  front = 0
  back = matrix.length - 1
  while front <= back
    mid = (front + back) / 2
    return true if matrix[mid].include?(target)

    if target < matrix[mid][0]
      back = mid - 1
    else
      front = mid + 1
    end
  end
  false
end
