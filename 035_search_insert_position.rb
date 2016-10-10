require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_035
    assert_equal 2, search_insert([1, 3, 5, 6], 5)
    assert_equal 1, search_insert([1, 3, 5, 6], 2)
    assert_equal 4, search_insert([1, 3, 5, 6], 7)
    assert_equal 0, search_insert([1, 3, 5, 6], 0)
  end
end

def search_insert(nums, target)
  return 0 if nums.length.zero?

  front = 0
  back = nums.length - 1

  while front <= back
    mid = (front + back) / 2
    return mid if nums[mid] == target
    if nums[mid] < target
      front = mid + 1
    else
      back = mid - 1
    end
  end
  front
end
