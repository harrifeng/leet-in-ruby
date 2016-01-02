require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_two_sum
    assert_equal 0, max_area([1])
    assert_equal 45, max_area([1,1, 2, 3, 4, 15, 4, 2, 19, 8])
  end
end

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  if height.length < 2
    return 0
  end
  maxv = 0
  left = 0
  right = height.length - 1
  size = 0
  while left < right do
    size = [height[left], height[right]].min * (right - left)
    maxv = [maxv, size].max
    if height[left]  < height[right]
      left += 1
    else
      right -= 1
    end
  end
  return maxv
end
