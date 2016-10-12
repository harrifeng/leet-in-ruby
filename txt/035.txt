"""
Given a sorted array and a target value, return the index if the target is
found. If not, return the index where it would be if it were inserted in
order.
You may assume no duplicates in the array.
Here are few examples.
[1,3,5,6], 5 -> 2
[1,3,5,6], 2 -> 1
[1,3,5,6], 7 -> 4
[1,3,5,6], 0 -> 0
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(2, solution.searchInsert([1, 3, 5, 6], 5))
        self.assertEqual(1, solution.searchInsert([1, 3, 5, 6], 2))
        self.assertEqual(4, solution.searchInsert([1, 3, 5, 6], 7))
        self.assertEqual(0, solution.searchInsert([1, 3, 5, 6], 0))


class Solution(object):

    def searchInsert(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        beg = 0
        end = len(nums) - 1
        while beg <= end:
            mid = (beg + end) / 2
            if nums[mid] == target:
                return mid
            elif nums[mid] < target:
                beg = mid + 1
            else:
                end = mid - 1
        return beg
