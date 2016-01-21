require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal 3, search([4, 5, 6, 7, 0, 1, 2], 7)
  end
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  if (nums.length == 0)
    return -1
  end
  if (nums.length == 1)
    if nums[0] == target
      return 0
    else
      return -1
    end
  end

  mid = nums.length / 2 - 1
  if (nums[0] <= nums[mid])      # left is arising
    if (target >= nums[0] && target <= nums[mid])
      return search(nums[0..mid], target)
    else
      if search(nums[mid+1..-1], target) == -1
        return -1
      else
        return mid + 1 + search(nums[mid+1..-1], target)
      end
    end
  else                          # right is arising
    if target >= nums[mid+1] && target <= nums[-1]
      if search(nums[mid+1..-1], target) == -1
        return -1
      else
        return mid + 1 + search(nums[mid+1..-1], target)
      end
    else
      return search(nums[0..mid], target)
    end
  end
end
