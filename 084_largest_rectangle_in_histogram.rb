require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_084
    assert_equal 10, largest_rectangle_area([2, 1, 5, 6, 2, 3])
  end
end

# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area(heights)
  heights.push 0
  i = 0
  maxv = 0
  stack = []

  while i < heights.length
    if stack.empty? || heights[i] > heights[stack[-1]]
      stack.push i
      i += 1
    else
      cur_i = stack.pop
      width = if stack.empty?
                i
              else
                i - stack[-1] - 1
              end
      maxv = [maxv, width * heights[cur_i]].max
    end
  end
  maxv
end
