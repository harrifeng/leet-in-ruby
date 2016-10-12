"""
Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one
sorted array.
Note:
You may assume that nums1 has enough space (size that is greater or equal to m
+ n) to hold additional elements from nums2. The number of elements
initialized in nums1 and nums2 are m and n respectively.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        nm1 = [1, 3, 5, 0, 0, 0]
        m = 3
        nm2 = [2, 4, 6]
        n = 3
        e1 = [1, 2, 3, 4, 5, 6]
        solution.merge(nm1, m, nm2, n)
        self.assertEqual(e1, nm1)


class Solution(object):

    def merge(self, nums1, m, nums2, n):
        """
        :type nums1: List[int]
        :type m: int
        :type nums2: List[int]
        :type n: int
        :rtype: void Do not return anything, modify nums1 in-place instead.
        """
        m -= 1
        n -= 1

        while m >= 0 and n >= 0:
            if nums1[m] > nums2[n]:
                nums1[m + n + 1] = nums1[m]
                m -= 1
            else:
                nums1[m + n + 1] = nums2[n]
                n -= 1
        while n >= 0:
            nums1[n] = nums2[n]
            n -= 1
        return
