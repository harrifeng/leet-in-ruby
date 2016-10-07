require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_078
    assert_equal [[3],
                  [1],
                  [2],
                  [1, 2, 3],
                  [1, 3],
                  [2, 3],
                  [1, 2],
                  []].sort, subsets([1, 2, 3]).sort
  end
end

# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  return [] if nums.length.zero?
  ret = []
  helper_078(nums, [], ret)
  ret
end

def helper_078(nums, tmp, ret)
  ret.push tmp.dup

  nums.length.times do |i|
    tmp.push nums[i]
    helper_078(nums.slice(i + 1, nums.length), tmp, ret)
    tmp.pop
  end
end
