require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_015
    assert_equal [[-1, 0, 1], [-1, -1, 2]].sort,
                 three_sum([-1, 0, 1, 2, -1, 4]).sort
  end
end

def three_sum(nums)
  nums.sort!
  ret = []

  0.upto(nums.length - 3) do |i|
    next if i > 0 && nums[i] == nums[i - 1]
    front = i + 1
    back = nums.length - 1

    while front < back
      cnt = nums[front] + nums[back] + nums[i]
      if cnt.zero?
        ret.push([nums[i], nums[front], nums[back]])
        while front < back && (nums[front] == nums[front + 1]) && (nums[back] == nums[back - 1])
          front += 1
          back -= 1
        end
        front += 1
        back -= 1
      elsif cnt < 0
        front += 1
      else
        back -= 1
      end
    end
  end
  ret
end
