require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_034
    assert_equal [3, 4], search_range([5, 7, 7, 8, 8, 10], 8)
  end
end

def search_range(nums, target)
  high = -1
  low = -1
  return [low, hight] if nums.length.zero?

  front = 0
  back = nums.length - 1

  while front <= back
    mid = (front + back) / 2
    if nums[mid] == target
      low = mid
      back = mid - 1
    elsif nums[mid] < target
      front = mid + 1
    else
      back = mid - 1
    end
  end

  front = 0
  back = nums.length - 1

  while front <= back
    mid = (front + back) / 2
    if nums[mid] == target
      high = mid
      front = mid + 1
    elsif nums[mid] < target
      front = mid + 1
    else
      back = mid - 1
    end
  end
  [low, high]
end
