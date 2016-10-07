require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_081
    assert search_ii([1, 3, 1, 1, 1], 3)
  end
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Boolean}
def search_ii(nums, target)
  return false if nums.length.zero?

  front = 0
  back = nums.length - 1

  while front <= back
    mid = (front + back) / 2
    return true if nums[mid] == target
    if nums[front] < nums[mid]
      if nums[front] <= target && target < nums[mid]
        back = mid - 1
      else
        front = mid + 1
      end
    elsif nums[mid] < nums[back]
      if nums[mid] < target && target <= nums[back]
        front = mid + 1
      else
        back = mid - 1
      end
    elsif nums[front] == nums[mid]
      front += 1
    else
      back -= 1
    end
  end
  false
end
