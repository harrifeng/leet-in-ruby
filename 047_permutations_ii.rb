require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_047
    assert_equal [[1, 1, 2], [1, 2, 1], [2, 1, 1]].sort,
                 permute_ii([1, 1, 2]).sort
  end
end

def permute_ii(nums)
  ret = []
  helper_047(nums.sort, 0, ret)
  ret
end

def helper_047(nums, level, ret)
  if level == nums.length
    ret.push(nums.dup)
    return
  end
  (level...nums.length).each do |i|
    next unless (i == level) || !nums[level...i].include?(nums[i])
    nums[level], nums[i] = nums[i], nums[level]
    helper_047(nums, level + 1, ret)
    nums[level], nums[i] = nums[i], nums[level]
  end
end
