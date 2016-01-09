# coding: utf-8
require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal 2, three_sum_closest([-1, 2, 1, -4], 1)
  end
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  if nums.length < 3
    return 0
  end
  nums.sort!
  ret = nums[0] + nums[1] + nums[2]
  for i in (0..nums.length-3)
    front = i + 1
    back = nums.length - 1

    while front < back do
      sum = nums[i] + nums[front] + nums[back]
      if sum == target
        return sum
      elsif sum < target
        front += 1
      else
        back -= 1
      end

      if (sum - target).abs < (ret - target).abs
        ret = sum
      end
    end
  end
  return ret
end
