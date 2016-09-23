require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_004
    assert_in_delta 1.0, find_median_sorted_arrays([1, 2], [1, 1]), 0.01
    assert_in_delta 2.5, find_median_sorted_arrays([], [2, 3]), 0.01
    assert_in_delta 1.5, find_median_sorted_arrays([1, 2], [1, 2]), 0.01
    assert_in_delta 2.5, find_median_sorted_arrays([2, 3, 4], [1]), 0.01
  end
end

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  cnt = nums1.length + nums2.length
  return find_nth(nums1, nums2, cnt / 2 + 1) if cnt.odd?
  (find_nth(nums1, nums2, cnt / 2 + 1) + find_nth(nums1, nums2, cnt / 2)) / 2.0
end

def find_nth(nums1, nums2, nth)
  return find_nth(nums2, nums1, nth) if nums1.length > nums2.length
  return nums2[nth - 1] if nums1.length.zero?
  return nums1[nth - 1] if nums2.length.zero?
  return [nums1[0], nums2[0]].min if nth == 1

  part_a = [nums1.length, nth / 2].min
  part_b = nth - part_a

  if nums1[part_a - 1] < nums2[part_b - 1]
    return find_nth(nums1[part_a..nums1.length], nums2, nth - part_a)
  end

  find_nth(nums1, nums2[part_b..nums2.length], nth - part_b)
end
