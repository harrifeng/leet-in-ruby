require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_053
    assert_equal 6, max_sub_array([-2, 1, -3, 4, -1, 2, 1, -5, 4])
    assert_equal 1, max_sub_array([-2, 1])
    assert_equal(-1, max_sub_array([-1]))
    assert_equal(-1, max_sub_array([-2, -1]))
  end
end

# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  return 0 if nums.length.zero?
  maxv = nums[0]
  sum = nums[0]
  1.upto(nums.length - 1) do |i|
    sum = [nums[i], sum + nums[i]].max
    maxv = [maxv, sum].max
  end
  maxv
end
