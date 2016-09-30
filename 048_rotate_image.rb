require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_048
    m1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    r1 = [[7, 4, 1], [8, 5, 2], [9, 6, 3]]
    rotate_leet(m1)
    assert_equal r1, m1
  end
end

def rotate_leet(matrix)
  len = matrix.length

  len.times do |i|
    len.times do |j|
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j] if i < j
    end
  end

  len.times do |i|
    len.times do |j|
      if j < len / 2
        matrix[i][j], matrix[i][len - 1 - j] =
          matrix[i][len - 1 - j], matrix[i][j]
      end
    end
  end
  nil
end
