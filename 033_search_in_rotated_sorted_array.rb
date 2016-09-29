require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_033
    assert_equal 1, search([3, 1], 1)
    assert_equal(-1, search([1], 0))
    assert_equal 4, search([4, 5, 6, 7, 0, 1, 2], 0)
  end
end

def search(nums, target)
  return -1 if nums.length.zero?

  front = 0
  back = nums.length - 1

  while front <= back
    mid = (front + back) / 2
    return mid if nums[mid] == target

    if nums[front] <= nums[mid]
      if nums[front] <= target && target < nums[mid]
        back = mid - 1
      else
        front = mid + 1
      end
    else
      if nums[mid] < target && target <= nums[back]
        front = mid + 1
      else
        back = mid - 1
      end
    end
  end
  -1
end
