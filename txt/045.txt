"""
Given an array of non-negative integers, you are initially positioned at the
first index of the array.
Each element in the array represents your maximum jump length at that position.
Your goal is to reach the last index in the minimum number of jumps.
For example:
Given array A = [2,3,1,1,4]
The minimum number of jumps to reach the last index is 2. (Jump 1 step from
index 0 to 1, then 3 steps to the last index.)
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(2, solution.jump([2, 3, 1, 1, 4]))
        self.assertEqual(5, solution.jump([5, 6, 4, 4, 6, 9, 4, 4, 7, 4, 4,
                                           8, 2, 6, 8, 1, 5, 9, 6, 5, 2, 7,
                                           9, 7, 9, 6, 9, 4, 1, 6, 8, 8, 4,
                                           4, 2, 0, 3, 8, 5]))


class Solution(object):

    def jump(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        ret = 0
        last = 0
        cur = 0
        for i, c in enumerate(nums):
            if i > last:
                last = cur
                ret += 1
            cur = max(cur, i + c)
        return ret
