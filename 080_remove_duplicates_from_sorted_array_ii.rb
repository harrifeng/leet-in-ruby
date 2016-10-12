require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_080
    a1 = [1, 1, 1, 2, 2, 3]
    r1 = [1, 1, 2, 2, 3]
    t1 = remove_duplicates_ii(a1)
    assert_equal(r1, a1.take(t1))
  end
end

# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates_ii(nums)
  return 0 if nums.length.zero?
  pre = 0
  cnt = 1
  1.upto(nums.length - 1) do |i|
    if nums[i] != nums[i - 1]
      pre += 1
      nums[pre] = nums[i]
      cnt = 1
    else
      if cnt == 1
        pre += 1
        nums[pre] = nums[i]
      end
      cnt += 1
    end
  end
  pre + 1
end
