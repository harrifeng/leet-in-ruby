"""
Given a set of distinct integers, nums, return all possible subsets.

Note:
Elements in a subset must be in non-descending order.
The solution set must not contain duplicate subsets.
For example,
If nums = [1,2,3], a solution is:

[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(sorted([[3],
                                 [1],
                                 [2],
                                 [1, 2, 3],
                                 [1, 3],
                                 [2, 3],
                                 [1, 2],
                                 []]
                                ), sorted(solution.subsets([1, 2, 3])))


class Solution(object):

    def subsets(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        def helper(nums, tmp, ret):
            ret.append(tmp[:])
            for i, c in enumerate(nums):
                tmp.append(c)
                helper(nums[i + 1:], tmp, ret)
                tmp.pop()

        ret = []
        helper(sorted(nums), [], ret)
        return ret
