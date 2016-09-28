require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_018
    assert_equal [[-1, 0, 0, 1],   [-2, -1, 1, 2], [-2, 0, 0, 2]].sort,
                 four_sum([1, 0, -1, 0, -2, 2], 0).sort
  end
end

def four_sum(nums, target)
  nums.sort!
  ret = []
  (nums.length - 3).times do |i|
    next if (i > 0) && (nums[i] == nums[i - 1])
    (i + 1).upto(nums.length - 3) do |j|
      next if (j > i + 1) && (nums[j] == nums[j - 1])
      front = j + 1
      back = nums.length - 1
      while front < back
        cnt = nums[i] + nums[j] + nums[front] + nums[back]
        if cnt == target
          ret.push([nums[i], nums[j], nums[front], nums[back]])
          while front < back && nums[front] == nums[back] &&
                nums[back] == nums[back - 1]
            front += 1
            back -= 1
          end
          front += 1
          back -= 1
        elsif cnt < target
          front += 1
        else
          back -= 1
        end
      end
    end
  end
  ret
end
