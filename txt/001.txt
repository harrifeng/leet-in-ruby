"""
Given an array of integers, return indices of the two numbers such that they
add up to a specific target.
You may assume that each input would have exactly one solution.
Example:
  Given nums = [2, 7, 11, 15], target = 9,
  Because nums[0] + nums[1] = 2 + 7 = 9,
  return [0, 1].
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual([0, 1], solution.twoSum([2, 7, 1, 15], 9))


class Solution(object):

    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        d = {}
        for i, n in enumerate(nums):
            if (target - n) in d:
                return [d[target - n], i]
            d[n] = i
