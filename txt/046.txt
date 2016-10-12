"""
Given a collection of distinct numbers, return all possible permutations.
For example,
[1,2,3] have the following permutations:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], and [3,2,1].
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(sorted([[1, 2, 3], [1, 3, 2], [2, 1, 3],
                                 [2, 3, 1], [3, 1, 2], [3, 2, 1]]),
                         sorted(solution.permute([1, 2, 3])))


class Solution(object):

    def permute(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        def helper(nums, level, ret):
            if level == len(nums):
                ret.append(nums[:])
                return
            for i in range(level, len(nums)):
                nums[i], nums[level] = nums[level], nums[i]
                helper(nums, level + 1, ret)
                nums[i], nums[level] = nums[level], nums[i]
        ret = []
        helper(nums, 0,  ret)
        return ret
