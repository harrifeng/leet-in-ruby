"""
There are two sorted arrays nums1 and nums2 of size m and n respectively.
Find the median of the two sorted arrays. The overall run time complexity
should be O(log (m+n)).
For example:
  nums1 = [1, 2], nums2 = [1, 1]
  median = 1.0
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        d = 0.00001
        self.assertAlmostEqual(1.0, solution.findMedianSortedArrays(
            [1, 2], [1, 1]), delta=d)
        self.assertAlmostEqual(2.5, solution.findMedianSortedArrays(
            [], [2, 3]), delta=d)
        self.assertAlmostEqual(1.5, solution.findMedianSortedArrays(
            [1, 2], [1, 2]), delta=d)
        self.assertAlmostEqual(2.5, solution.findMedianSortedArrays(
            [2, 3, 4], [1]), delta=d)


class Solution(object):

    def findMedianSortedArrays(self, nums1, nums2):
        """
        :type nums1: List[int]
        :type nums2: List[int]
        :rtype: float
        """
        cnt = len(nums1) + len(nums2)
        if cnt % 2 == 0:
            return (self.findNth(nums1, nums2, cnt / 2) +
                    self.findNth(nums1, nums2, cnt / 2 + 1)) / 2.0
        else:
            return self.findNth(nums1, nums2, cnt / 2 + 1)

    def findNth(self, nums1, nums2, nth):
        if len(nums1) > len(nums2):
            return self.findNth(nums2, nums1, nth)

        if len(nums1) == 0:
            return nums2[nth - 1]
        if len(nums2) == 0:
            return nums1[nth - 1]

        if nth == 1:
            return min(nums1[0], nums2[0])

        pa = min(nth / 2, len(nums1))
        pb = nth - pa

        if nums1[pa - 1] < nums2[pb - 1]:
            return self.findNth(nums1[pa:], nums2, nth - pa)
        else:
            return self.findNth(nums1, nums2[pb:], nth - pb)
