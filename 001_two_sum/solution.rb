require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    assert_equal [1, 2],  two_sum([2, 7, 11, 15], 9)
  end
end


# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  m = {}
  nums.each_with_index do |n, i|
    if m[target - n] != nil
      return [i + 1, m[target - n] + 1].minmax
    else
      m[n] = i
    end
  end
end
