"""
Given a set of candidate numbers (C) and a target number (T), find all unique
combinations in C where the candidate numbers sums to T.
The same repeated number may be chosen from C unlimited number of times.
Note:
All numbers (including target) will be positive integers.
Elements in a combination (a1, a2, ..., ak) must be in non-descending order.
(ie, a1 <= a2 <= ... <= ak).
The solution set must not contain duplicate combinations.
For example, given candidate set 2,3,6,7 and target 7,
A solution set is:
[7]
[2, 2, 3]
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(sorted([[7], [2, 2, 3]]),
                         sorted(solution.combinationSum([2, 3, 6, 7], 7)))


class Solution(object):

    def combinationSum(self, candidates, target):
        """
        :type candidates: List[int]
        :type target: int
        :rtype: List[List[int]]
        """
        def helper(target, nums, tmp, ret):
            if target == 0:
                ret.append(tmp[:])
                return
            for i, n in enumerate(nums):
                if target >= n:
                    tmp.append(n)
                    helper(target - n, nums[i:], tmp, ret)
                    tmp.pop()

        ret = []
        helper(target, sorted(candidates), [], ret)
        return ret
