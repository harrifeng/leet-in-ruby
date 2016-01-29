require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    m1 = [[1,2,3], [4, 5, 6],[7,8,9]]
    rotate(m1)
    assert_equal [[7,4,1],[8,5,2],[9,6,3]], m1
  end
end

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  if matrix.length == 0 || matrix.length == 1
    return matrix
  end
  n = matrix[0].length
  front = 0
  back = n - 1
  while front < back
    matrix[front], matrix[back] = matrix[back], matrix[front]
    front += 1
    back -= 1
  end

  for i in (0..n-1)
    for j in (0..n-1)
      if j > i
        matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
      end
    end
  end
end
