require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_077
    assert_equal [[2, 4],
                  [3, 4],
                  [2, 3],
                  [1, 2],
                  [1, 3],
                  [1, 4]].sort, combine(4, 2).sort
  end
end

# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine(n, k)
  return [] if n.zero?
  nums = (1..n).to_a
  ret = []
  helper_076(nums, k, [], ret)
  ret
end

def helper_076(nums, k, tmp, ret)
  if k.zero?
    ret.push tmp.dup
    return
  end

  nums.length.times do |i|
    tmp.push nums[i]
    helper_076(nums.slice(i + 1, nums.length), k - 1, tmp, ret)
    tmp.pop
  end
end
