# frozen_string_literal: true
require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_034
    assert_equal [3, 4], search_range([5, 7, 7, 8, 8, 10], 8)
  end
end


# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  low = -1
  high = -1

  front = 0
  back = nums.length - 1

  while front <= back
    mid = (front + back) / 2
    if target == nums[mid]
      low = mid
      # lower
      back = mid - 1
    elsif target < nums[mid]
      back = mid - 1
    else
      front = mid + 1
    end
  end

  front = 0
  back = nums.length - 1

  while front <= back
    mid = (front + back) / 2
    if target == nums[mid]
      high = mid
      front = mid + 1
    elsif target < nums[mid]
      back = mid - 1
    else
      front = mid + 1
    end
  end

  [low, high]
end
