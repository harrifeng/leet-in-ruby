# frozen_string_literal: true
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
  i = m - 1
  j = n - 1
  while i >= 0 && j >= 0
    if nums1[i] > nums2[j]
      nums1[i + j + 1] = nums1[i]
      i -= 1
    else
      nums1[i + j + 1] = nums2[j]
      j -= 1
    end
  end

  while j >= n
    nums1[i + j + 1] = nums2[j]
    j -= 1
  end
end
