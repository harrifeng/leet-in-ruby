require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal 2, jump([2, 3, 1, 1, 4])
    assert_equal 5, jump([5,6,4,4,6,9,4,4,7,4,4,8,2,6,8,1,5,9,6,5,2,7,9,7,9,6,9,4,1,6,8,8,4,4,2,0,3,8,5])
  end
end

# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
  maxv = 0
  tmp = 0
  ret = 0
  n = nums.length
  for i in (0..n-1)
    if tmp >= n - 1
      break
    end
    while i <= tmp
      maxv = [maxv, nums[i] + i].max
      i += 1
    end
    ret += 1
    tmp = maxv
  end
  return ret
end
