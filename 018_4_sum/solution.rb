# coding: utf-8
require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal [[-1, 0, 0,1],[-2, -1, 1,2], [-2, 0, 0, 2]].sort, four_sum([1, 0, -1, 0, -2, 2], 0).sort
  end
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def four_sum(nums, target)
  if nums.length < 4
    return []
  end
  nums.sort!
  ret = []
  for i in (0..nums.length-4) do
    if i > 0 && nums[i] ==nums[i-1]
      next
    end
    for j in (i+1..nums.length-3) do
      if j > i+1 && nums[j]== nums[j-1]
        next
      end
      front = j + 1
      back = nums.length - 1
      while front < back do
        sum = nums[i] + nums[j] + nums[front] + nums[back]
        if sum == target
          ret << [nums[i], nums[j], nums[front], nums[back]]
          while front < back && nums[front] == nums[front+1] && nums[back] == nums[back-1] do
            front += 1
            back -= 1
          end
          front += 1
          back -= 1
        elsif sum < target
          front += 1
        else
          back -= 1
        end
      end
    end
  end
  return ret
end
