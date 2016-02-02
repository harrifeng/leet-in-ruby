require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal 2, first_missing_positive([1, 1])
    assert_equal 2, first_missing_positive([3, 4, -1, 1])
    assert_equal 3, first_missing_positive([1, 2, 0])
    assert_equal 9, first_missing_positive([1, 3, 4, 8 , 6, 5, 7, 2, 10, 12, 11])
  end
end

# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
  n = nums.length
  i = 0
  while i < n do
    if (nums[i] > 0) && (nums[i] < n) && (nums[i] != i) && (nums[nums[i]] != nums[i])
      tmp = nums[i]
      nums[i] = nums[tmp]
      nums[tmp] = tmp
    # following will not work
    # nums[i], nums[nums[i]] = nums[nums[i]], nums[i]
    else
      i += 1
    end
  end

  for i in (1..n-1)
    if nums[i] != i
      return i
    end
  end

  return (nums[0] == n) ? n + 1 : n;
end
