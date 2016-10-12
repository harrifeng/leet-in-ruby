"""
Given a roman numeral, convert it to an integer.
Input is guaranteed to be within the range from 1 to 3999.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(1, solution.romanToInt("I"))
        self.assertEqual(4, solution.romanToInt("IV"))
        self.assertEqual(7, solution.romanToInt("VII"))
        self.assertEqual(400, solution.romanToInt("CD"))
        self.assertEqual(2345, solution.romanToInt("MMCCCXLV"))


class Solution(object):

    def romanToInt(self, s):
        """
        :type s:str
        :rtype: int
        """
        N = len(s)
        if N == 0:
            return 0
        d = {"M": 1000, "D": 500, "C": 100, "L": 50, "X": 10, "V": 5, "I": 1}
        ret = d[s[N - 1]]
        for i in reversed(range(N - 1)):
            if d[s[i]] >= d[s[i + 1]]:
                ret += d[s[i]]
            else:
                ret -= d[s[i]]
        return ret
