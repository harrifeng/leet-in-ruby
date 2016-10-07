require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_075
    r1 = [0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2]
    a1 = [0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 2, 2, 0, 2, 2]
    sort_colors(a1)
    assert_equal(r1, a1)

    r2 = [2, 2]
    a2 = [2, 2]
    sort_colors(a2)
    assert_equal(r2, a2)
  end
end

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
  return if nums.length <= 1

  front = -1
  mid = 0
  back = nums.length - 1

  while mid <= back
    if (nums[mid]).zero?
      front += 1
      nums[front], nums[mid] = nums[mid], nums[front]
      mid += 1
    elsif nums[mid] == 2
      nums[mid], nums[back] = nums[back], nums[mid]
      back -= 1
    else # nums[mid] == 1
      mid += 1
    end
  end
end
