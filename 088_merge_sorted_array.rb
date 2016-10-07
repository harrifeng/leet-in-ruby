require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_088
    nm1 = [1, 3, 5, 0, 0, 0]
    m = 3
    nm2 = [2, 4, 6]
    n = 3
    e1 = [1, 2, 3, 4, 5, 6]
    merge_088(nm1, m, nm2, n)
    assert_equal(e1, nm1)
  end
end

# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge_088(nums1, m, nums2, n)
  m -= 1
  n -= 1
  while (m >= 0) && (n >= 0)
    if nums1[m] > nums2[n]
      nums1[m + n + 1] = nums1[m]
      m -= 1
    else
      nums1[m + n + 1] = nums2[n]
      n -= 1
    end
  end

  while n >= 0
    nums1[n] = nums2[n]
    n -= 1
  end
end
