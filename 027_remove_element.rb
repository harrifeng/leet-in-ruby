require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_027
    a1 = [3, 2, 2, 3]
    n1 = 2
    r1 = [2, 2]
    assert_equal n1, remove_element(a1, 3)
    assert_equal r1, a1[0...n1]
  end
end

def remove_element(nums, val)
  pre = -1
  nums.length.times do |i|
    if val != nums[i]
      pre += 1
      nums[pre] = nums[i]
    end
  end
  pre + 1
end
