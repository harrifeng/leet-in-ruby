require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal [[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]].sort, permute([1, 2, 3]).sort
  end
end

# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  ret = []
  do_permute(nums, 0, ret)
  return ret
end

def do_permute(nums, level, sum)
  if level == nums.length
    sum << nums.dup
    return
  end

  for i in (level..nums.length-1) do
    nums[i], nums[level] = nums[level], nums[i]
    do_permute(nums, level + 1, sum)
    nums[i], nums[level] = nums[level], nums[i]
  end
end
