# coding: utf-8
require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal [[-1, 0, 1],[-1, -1,2]].sort, three_sum([-1, 0, 1, 2, -1, -4]).sort
  end
end

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  if nums.length < 3
    return []
  end
  nums.sort!
  ret = []
  for i in (0..nums.length-3) do
    if i > 0 && nums[i] == nums[i-1]
      next
    end
    front = i + 1
    back = nums.length - 1
    while front < back do
      sum = nums[i] + nums[front] + nums[back]
      if sum == 0
        ret << [nums[i], nums[front], nums[back]]
        while front < back && nums[front]== nums[front+1] && nums[back] == nums[back-1] do
          front += 1
          back -= 1
        end
        front += 1
        back -= 1
      elsif sum < 0
        front += 1
      else
        back -= 1
      end
    end
  end
  return ret
end
