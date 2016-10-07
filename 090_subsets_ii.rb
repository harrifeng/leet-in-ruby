require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_090
    assert_equal [
      [1],
      [2],
      [1, 2, 2],
      [2, 2],
      [1, 2],
      []
    ].sort, subsets_with_dup([1, 2, 2]).sort
  end
end

# @param {Integer[]} nums
# @return {Integer[][]}
def subsets_with_dup(nums)
  return [] if nums.length.zero?
  ret = []
  helper_090(nums.sort, [], ret)
  ret
end

def helper_090(nums, tmp, ret)
  ret.push(tmp.dup)

  nums.each_with_index do |c, i|
    next if i > 0 && (nums[i] == nums[i - 1])
    tmp.push c
    helper_090(nums[i + 1...nums.length], tmp, ret)
    tmp.pop
  end
end
