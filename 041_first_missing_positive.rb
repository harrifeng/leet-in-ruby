require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_041
    assert_equal 5, first_missing_positive([0, 2, 2, 4, 0, 1, 0, 1, 3, 6, 7, 9])
  end
end

def first_missing_positive(nums)
  i = 0
  while i < nums.length
    if nums[i] < 1 || nums[i] > nums.length || nums[i] == i + 1
      i += 1
    else
      val = nums[i]
      if nums[val - 1] == val
        i += 1
        next
      end
      nums[val - 1], nums[i] = nums[i], nums[val - 1]
    end
  end

  nums.length.times do |j|
    return j + 1 if nums[j] != j + 1
  end
  nums.length + 1
end
