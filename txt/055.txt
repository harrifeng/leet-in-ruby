"""
Given an array of non-negative integers, you are initially positioned at the
first index of the array.
Each element in the array represents your maximum jump length at that position.
Determine if you are able to reach the last index.
For example:
A = [2,3,1,1,4], return true.
A = [3,2,1,0,4], return false.
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertTrue(solution.canJump([2, 3, 1, 1, 4]))
        self.assertFalse(solution.canJump([3, 2, 1, 0, 4]))


class Solution(object):

    def canJump(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        pos = 0
        for i, c in enumerate(nums):
            if pos < i:
                return False
            pos = max(pos, i + c)
        return True
