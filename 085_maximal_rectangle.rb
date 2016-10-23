require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_085
    assert_equal 6, maximal_rectangle(
      [%w(0 0 0 0),
       %w(1 1 1 1),
       %w(1 1 1 0),
       %w(0 1 0 0)]
    )

    assert_equal 6, maximal_rectangle(
      [%w(1 0 1 0 0),
       %w(1 0 1 1 1),
       %w(1 1 1 1 1),
       %w(1 0 0 1 0)]
    )
  end
end

# @param {Character[][]} matrix
# @return {Integer}
def maximal_rectangle(matrix)
  return 0 if matrix.length.zero?
  m = matrix.length
  n = matrix[0].length

  maxv = 0

  heights = [0] * n
  m.times do |i|
    n.times do |j|
      if matrix[i][j] == '0'
        heights[j] = 0
      else
        heights[j] += 1
      end
    end
    maxv = [maxv, helper_085(heights)].max
  end
  maxv
end

def helper_085(heights)
  heights.push 0
  stack = []
  i = 0
  maxv = 0

  while i < heights.length
    if stack.empty? || heights[i] >= heights[stack[-1]]
      stack.push(i)
      i += 1
    else
      cur_i = stack.pop
      width = if stack.empty?
                i
              else
                i - stack[-1] - 1
              end
      maxv = [maxv, heights[cur_i] * width].max
    end
  end
  maxv
end
