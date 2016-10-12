"""
Given a digit string, return all possible letter combinations that the number
could represent.
A mapping of digit to letters (just like on the telephone buttons) is given
below.


Input:Digit string "23"
Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(["ad", "ae", "af", "bd", "be", "bf", "cd", "ce",
                          "cf"], solution.letterCombinations("23"))


class Solution(object):

    def letterCombinations(self, digits):
        """
        :type digits: str
        :rtype: List[str]
        """
        self.dmap = {'2': 'abc', '3': 'def', '4': 'ghi', '5': 'jkl',
                     '6': 'mno', '7': 'pqrs', '8': 'tuv', '9': 'wxyz'}
        if len(digits) == 0:
            return []
        ret = []
        self.doCom(digits, 0, "", ret)
        return ret

    def doCom(self, digits, level, tmp, ret):
        if level == len(digits):
            ret = ret.append(tmp[:])
            return
        for c in self.dmap[digits[level]]:
            self.doCom(digits, level + 1, tmp + c, ret)
