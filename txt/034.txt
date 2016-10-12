"""
Given a sorted array of integers, find the starting and ending position of a
given target value.
Your algorithm's runtime complexity must be in the order of O(log n).
If the target is not found in the array, return [-1, -1].
For example,
  Given [5, 7, 7, 8, 8, 10] and target value 8,
  return [3, 4].
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual([3, 4], solution.searchRange([5, 7, 7, 8, 8, 10], 8))


class Solution(object):

    def searchRange(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        N = len(nums)
        beg, end = 0, N - 1
        low, high = -1, -1
        while beg <= end:
            mid = (beg + end) / 2
            if nums[mid] == target:
                low = mid
                end = mid - 1
            elif nums[mid] < target:
                beg = mid + 1
            else:
                end = mid - 1
        beg, end = 0, N - 1
        while beg <= end:
            mid = (beg + end) / 2
            if nums[mid] == target:
                high = mid
                beg = mid + 1
            elif nums[mid] < target:
                beg = mid + 1
            else:
                end = mid - 1
        return [low, high]
