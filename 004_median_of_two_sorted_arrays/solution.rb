require 'test/unit'

class MyTest < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_leet_function
    delta = 0.00001
    assert_in_delta 1.0, find_median_sorted_arrays([1,2], [1, 1]), delta
    assert_in_delta 2.5, find_median_sorted_arrays([], [2, 3]), delta
    assert_in_delta 1.5, find_median_sorted_arrays([1, 2], [1, 2]), delta
    assert_in_delta 2.5, find_median_sorted_arrays([2, 3, 4], [1]), delta
  end
end

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  sum = nums1.length + nums2.length
  if (sum) % 2 == 0
    return (find_sorted_arrays_nth(nums1, nums2, (sum) / 2) + find_sorted_arrays_nth(nums1, nums2, (sum) / 2 + 1)) / 2.0
  else
    return find_sorted_arrays_nth(nums1, nums2, (sum) / 2 + 1)
  end
end


def find_sorted_arrays_nth(nums1, nums2, nth)
  if nums1.length > nums2.length
    # Very very important here, stop loop forward
    return find_sorted_arrays_nth(nums2, nums1, nth)
  end

  if nums1 == nil || nums1.length == 0
    return nums2[nth-1]
  end
  if nums2 == nil || nums2.length == 0
    return nums1[nth-1]
  end

  # nums1 is smaller in size
  if nth == 1
    return [nums1[0], nums2[0]].min
  end

  pa = [nums1.length, nth / 2].min
  pb = nth - pa
  if nums1[pa - 1] < nums2[pb - 1]
    return find_sorted_arrays_nth(nums1[pa..nums1.length], nums2, nth-pa)
  else
    return find_sorted_arrays_nth(nums1, nums2[pb..nums2.length], nth-pb)
  end
end
