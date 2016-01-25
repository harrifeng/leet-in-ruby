require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal [3, 4], search_range([5, 7, 7, 8, 8, 10], 8)
    assert_equal [-1, -1], search_range([1], 0)
  end
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  if nums.length == 0
    return [-1, -1]
  end

  front = 0
  back = nums.length - 1
  while front <= back
    mid = (front + back) / 2
    if nums[mid] == target
      first = mid
      second = mid
      while first > 0 && nums[first-1] == target do
        first -= 1
      end

      while second < nums.length-1 && nums[second+1] == target do
        second += 1
      end
      return [first, second]
    elsif nums[mid] < target
      front = mid + 1
    else
      back = mid - 1
    end
  end
  return [-1, -1]
end
