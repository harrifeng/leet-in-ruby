"""
Implement atoi to convert a string to an integer.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(123, solution.myAtoi("123"))
        self.assertEqual(-123, solution.myAtoi("-123"))
        self.assertEqual(2147483647, solution.myAtoi("2147483648"))
        self.assertEqual(-2147483648, solution.myAtoi("-2147483648"))
        self.assertEqual(0, solution.myAtoi(""))


class Solution(object):

    def myAtoi(self, str):
        """
        :type str: str
        :rtype: int
        """
        str = str.strip()
        N = len(str)
        if N == 0:
            return 0
        res = 0
        sign = 1
        imin, imax = -1 << 31, (1 << 31) - 1
        for i, bit in enumerate(str):
            if i == 0 and bit in ['-', '+']:
                if bit == '-':
                    sign = -1
            elif bit.isdigit():
                res = res * 10 + int(bit)
                if res * sign <= imin:
                    return imin
                elif res * sign >= imax:
                    return imax
            else:
                break
        return sign * res
