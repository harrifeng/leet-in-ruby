"""
Given two binary strings, return their sum (also a binary string).

For example,
a = "11"
b = "1"
Return "100".
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(11, solution.mySqrt(121))


class Solution(object):

    def mySqrt(self, x):
        """
        :type x: int
        :rtype: int
        """
        beg = 0
        end = x
        while beg <= end:
            mid = (beg + end) / 2
            sqr = mid * mid
            if sqr == x:
                return mid
            elif sqr < x:
                beg = mid + 1
            else:
                end = mid - 1
        return (beg + end) / 2
