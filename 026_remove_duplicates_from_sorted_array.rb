require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_026
    assert_equal 3, remove_duplicates([1, 2, 3])
    assert_equal 2, remove_duplicates([1, 2, 2])
    assert_equal 1, remove_duplicates([1, 1, 1])
  end
end

def remove_duplicates(nums)
  return 0 if nums.length.zero?

  pre = 0
  1.upto(nums.length - 1) do |i|
    if nums[i] != nums[i - 1]
      pre += 1
      nums[pre] = nums[i]
    end
  end
  pre + 1
end
