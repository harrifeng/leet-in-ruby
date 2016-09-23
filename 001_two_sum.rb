require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_001
    assert_equal [0, 1], two_sum([2, 7, 1, 15], 9)
    assert_equal [1, 3], two_sum([2, 3, 4, 19], 22)
  end
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  have = {}
  nums.each_with_index do |n, i|
    return [have[target - n], i] if have.include?(target - n)
    have[n] = i
  end
end
