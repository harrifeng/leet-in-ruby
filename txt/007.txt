"""
Reverse digits of an integer.
  Example1: x = 123, return 321
  Example2: x = -123, return -321
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(123, solution.reverse(321))
        self.assertEqual(-123, solution.reverse(-321))
        self.assertEqual(0, solution.reverse(2**31))


class Solution(object):

    def reverse(self, x):
        """
        :type x: int
        :rtype: int
        """
        sign = 1
        if x < 0:
            sign = -1
        x = abs(x)
        ret = 0
        while x > 0:
            ret = ret * 10 + x % 10
            x //= 10
        if ret > 2**31 - 1:
            return 0
        return sign * ret
