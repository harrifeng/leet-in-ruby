"""
Given a collection of candidate numbers (C) and a target number (T), find all
unique combinations in C where the candidate numbers sums to T.

Each number in C may only be used once in the combination.

Note:
All numbers (including target) will be positive integers.
Elements in a combination (a1, a2, ... , ak) must be in non-descending order.
(ie, a1 <= a2 <= ... <= ak).
The solution set must not contain duplicate combinations.
For example, given candidate set 10,1,2,7,6,1,5 and target 8,
A solution set is:
[1, 7]
[1, 2, 5]
[2, 6]
[1, 1, 6]
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(sorted([[1, 7], [1, 2, 5], [2, 6], [1, 1, 6]]),
                         sorted(solution.combinationSum2(
                             [10, 1, 2, 7, 6, 1, 5], 8)))


class Solution(object):

    def combinationSum2(self, candidates, target):
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
                if i > 0 and nums[i] == nums[i - 1]:
                    continue
                if target >= n:
                    tmp.append(n)
                    helper(target - n, nums[i + 1:], tmp, ret)
                    tmp.pop()

        ret = []
        helper(target, sorted(candidates), [], ret)
        return ret
