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
  end
end

def next_permutation(nums)
  return if nums.length < 2
  start = nums.length - 2
  start -= 1 while nums[start] > nums[start + 1]
  return nums.reverse! if start == -1

  finish = nums.length - 1
  finish -= 1 while nums[start] > nums[finish]
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
