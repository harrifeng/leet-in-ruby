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
        self.assertTrue(solution.isValid("{}"))
        self.assertTrue(solution.isValid("()[]{}"))
        self.assertFalse(solution.isValid("(]"))
        self.assertFalse(solution.isValid("([))"))


class Solution(object):

    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
        d = {'(': ')', '[': ']', '{': '}'}

        sta = []
        for c in s:
            if c in d:
                sta.append(c)
            elif len(sta) == 0 or c != d[sta.pop()]:
                return False
        return len(sta) == 0
