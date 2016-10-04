require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_055
    assert can_jump([2, 3, 1, 1, 4])
    assert !can_jump([3, 2, 1, 0, 4])
  end
end

# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  last = 0
  nums.each_with_index do |num, i|
    return false if last < i
    last = [last, i + num].max
  end
  true
end
