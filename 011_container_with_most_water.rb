require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_011
    assert_equal 0, max_area([1])
    assert_equal 45, max_area([1, 1, 2, 3, 4, 15, 4, 2, 19, 8])
  end
end

def max_area(height)
  return if height.length.zero?
  front = 0
  back = height.length - 1
  maxv = 0

  while front < back
    maxv = [maxv, (back - front) * [height[back], height[front]].min].max
    if height[back] < height[front]
      back -= 1
    else
      front += 1
    end
  end
  maxv
end
