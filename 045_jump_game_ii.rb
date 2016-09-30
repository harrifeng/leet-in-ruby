require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_045
    assert_equal 2, jump([2, 3, 1, 1, 4])
    assert_equal 5, jump([5, 6, 4, 4, 6, 9, 4, 4, 7, 4, 4,
                          8, 2, 6, 8, 1, 5, 9, 6, 5, 2, 7,
                          9, 7, 9, 6, 9, 4, 1, 6, 8, 8, 4,
                          4, 2, 0, 3, 8, 5])
  end
end

def jump(nums)
  return 0 if nums.length.zero?

  i = 1
  last = 0
  maxv = nums[0]
  step = 0
  while i < nums.length
    if last < i
      last = maxv
      step += 1
    end
    maxv = [maxv, nums[i] + i].max
    i += 1
  end
  step
end
