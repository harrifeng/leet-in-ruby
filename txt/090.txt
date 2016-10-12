"""
Given a collection of integers that might contain duplicates, nums, return all
possible subsets.
Note:
    Elements in a subset must be in non-descending order.
    The solution set must not contain duplicate subsets.
For example,
If nums = [1,2,2], a solution is:
[
  [2],
  [1],
  [1,2,2],
  [2,2],
  [1,2],
  []
]
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(sorted([
            [1],
            [2],
            [1, 2, 2],
            [2, 2],
            [1, 2],
            []]
        ), sorted(solution.subsetsWithDup([1, 2, 2])))


class Solution(object):

    def subsetsWithDup(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        def helper(nums, tmp, ret):
            ret.append(tmp[:])

            for i, c in enumerate(nums):
                if i > 0 and nums[i] == nums[i - 1]:
                    continue
                tmp.append(c)
                helper(nums[i + 1:], tmp, ret)
                tmp.pop()

        ret = []
        helper(sorted(nums), [], ret)
        return ret
