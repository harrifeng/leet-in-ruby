# frozen_string_literal: true
require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_016
    assert_equal 2, three_sum_closest([-1, 2, 1, -4], 1)
    assert_equal 82, three_sum_closest([1, 2, 4, 8, 16, 32, 64, 128], 82)
  end
end


# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  nums.sort!
  minv = nums.take(3).reduce(:+)

  (nums.length - 2).times do |i|
    front = i + 1
    back = nums.length - 1

    while front < back
      cnt = nums[i] + nums[front] + nums[back]
      minv = cnt if (cnt - target).abs < (minv - target).abs

      return cnt if cnt == target
      if cnt < target
        front += 1
      else
        back -= 1
      end
    end
  end
  minv
end
