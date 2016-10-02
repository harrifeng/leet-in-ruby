require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_031
    n1 = [1, 2, 3]
    r1 = [1, 3, 2]
    next_permutation(n1)
    assert_equal(r1, n1)

    n2 = [1, 3, 2]
    r2 = [2, 1, 3]
    next_permutation(n2)
    assert_equal(r2, n2)

    n3 = [3, 2, 1]
    r3 = [1, 2, 3]
    next_permutation(n3)
    assert_equal(r3, n3)

    n4 = [1, 5, 1]
    r4 = [5, 1, 1]
    next_permutation(n4)
    assert_equal(r4, n4)
  end
end

def next_permutation(nums)
  return if nums.length < 2
  start = nums.length - 2
  while start >= 0
    break if nums[start] < nums[start + 1]
    start -= 1
  end
  return nums.reverse! if start == -1

  finish = nums.length - 1
  while finish > start
    break if nums[finish] > nums[start]
    finish -= 1
  end
  # finish is the first that bigger than start
  nums[start], nums[finish] = nums[finish], nums[start]

  front = start + 1
  back = nums.length - 1
  while front < back
    nums[front], nums[back] = nums[back], nums[front]
    front += 1
    back -= 1
  end
  nil
end
