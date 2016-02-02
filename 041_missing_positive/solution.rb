require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    # assert_equal 2, first_missing_positive([1, 1])
    assert_equal 2, first_missing_positive([3, 4, -1, 1])
    assert_equal 3, first_missing_positive([1, 2, 0])
    assert_equal 9, first_missing_positive([1, 3, 4, 8 , 6, 5, 7, 2, 10, 12, 11])
  end
end

# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
  if nums.length == 0
    return 0
  end
  minv = nums[0]
  maxv = nums[0]
  nums.each do |n|
    if n < minv
      minv = n
    end
    if n > maxv
      maxv = n
    end
  end

  sum = 0
  nums.each do |n|
    sum = sum ^ n
  end
  (minv..maxv).each do |e|
    sum = sum ^ e
  end

  if sum == 0
    return minv > 1 ? minv - 1 : maxv + 1
  else
    return sum
  end
end
