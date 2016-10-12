"""
Suppose a sorted array is rotated at some pivot unknown to you beforehand.
(i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
You are given a target value to search. If found in the array return its index,
otherwise return -1.
You may assume no duplicate exists in the array.

"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(1, solution.search([3, 1], 1))
        self.assertEqual(-1, solution.search([1], 0))
        self.assertEqual(4, solution.search([4, 5, 6, 7, 0, 1, 2], 0))


class Solution(object):

    def search(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        N = len(nums)
        if N == 0:
            return -1
        beg = 0
        end = N - 1
        # Always be aware of Equal! imagine a equal example in your mind
        while beg <= end:
            mid = (beg + end) / 2
            if nums[mid] == target:
                return mid
            if nums[beg] <= nums[mid]:
                if nums[beg] <= target and target < nums[mid]:
                    end = mid - 1
                else:
                    beg = mid + 1
            else:
                if nums[mid] < target and target <= nums[end]:
                    beg = mid + 1
                else:
                    end = mid - 1
        return -1
