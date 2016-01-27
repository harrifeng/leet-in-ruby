require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal [[1,2], [2, 1]].sort, permute_unique([1, 2]).sort
    assert_equal [[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]].sort, permute_unique([1, 2, 3]).sort
    assert_equal [[1,1,2], [1, 2, 1], [2, 1, 1]].sort, permute_unique([1, 1, 2]).sort
    assert_equal [[1,1,2,2],[1,2,1,2],[1,2,2,1],[2,1,1,2],[2,1,2,1],[2,2,1,1]].sort, permute_unique([1, 1, 2, 2])
    assert_equal [[0,0,0,1,9],[0,0,0,9,1],[0,0,1,0,9],[0,0,1,9,0],
                  [0,0,9,0,1],[0,0,9,1,0],[0,1,0,0,9],[0,1,0,9,0],
                  [0,1,9,0,0],[0,9,0,0,1],[0,9,0,1,0],[0,9,1,0,0],
                  [1,0,0,0,9],[1,0,0,9,0],[1,0,9,0,0],[1,9,0,0,0],
                  [9,0,0,0,1],[9,0,0,1,0],[9,0,1,0,0],[9,1,0,0,0]], permute_unique([0,0,0,1,9]).sort
  end
end

# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique(nums)
  ret = []
  do_permute(nums.sort, 0, ret)
  return ret
end

def do_permute(nums, level, sum)
  if level == nums.length
    sum << nums.dup
    return
  end

  for i in (level..nums.length-1) do
    if i > level && (nums[i] == nums[level] || nums[i] == nums[i-1])
      next
    end
    nums[i], nums[level] = nums[level], nums[i]
    do_permute(nums, level + 1, sum)
    nums[i], nums[level] = nums[level], nums[i]
  end
end
