require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_047
    assert_equal [[1, 1, 2], [1, 2, 1], [2, 1, 1]].sort,
                 permute_unique([1, 1, 2]).sort
  end
end

# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique(nums)
  ret = []
  helper_047(nums.sort, 0, ret)
  ret
end

def helper_047(nums, level, ret)
  if nums.length == level
    ret.push nums.dup
    return
  end
  level.upto(nums.length - 1) do |i|
    next if nums[level...i].include?(nums[i])
    nums[level], nums[i] = nums[i], nums[level]
    helper_047(nums, level + 1, ret)
    nums[level], nums[i] = nums[i], nums[level]
  end
end


###########################################################################
#                  [1, 1, 2, 2]                                           #
#                   ^                                                     #
# [1, 1, 2, 2] [1, 1, 2, 2] [2, 1, 1, 2] [(1, 1, 2) (2)]                  #
#     ^         duplicated      ^         drop it becasue 2 in (1, 1, 2)  #
###########################################################################
