"""
Given an unsorted integer array, find the first missing positive integer.

For example,
Given [1,2,0] return 3,
and [3,4,-1,1] return 2.
Your algorithm should run in O(n) time and uses constant space.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(5, solution.firstMissingPositive(
            [0, 2, 2, 4, 0, 1, 0, 1, 3, 6, 7, 9]))


class Solution(object):

    def firstMissingPositive(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        N = len(nums)
        i = 0
        while i < N:
            # nums[i] is at most N, be careful about the N
            if nums[i] <= 0 or nums[i] > N or nums[i] == i + 1:
                i += 1
            else:
                tmp = nums[i]
                # More easy to understand, it's already OK, so continue
                if nums[tmp - 1] == tmp:
                    i += 1
                    continue
                nums[tmp - 1], nums[i] = nums[i], nums[tmp - 1]
        for i in range(N):
            if nums[i] != i + 1:
                return i + 1
        return N + 1
