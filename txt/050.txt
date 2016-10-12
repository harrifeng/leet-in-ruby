"""
Implement pow(x, n).
Subscribe to see which companies asked this question
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(8, solution.myPow(2, 3))


class Solution(object):

    def myPow(self, x, n):
        """
        :type x: float
        :type n: int
        :rtype: float
        """
        def powPos(x, n):
            if n == 0:
                return 1
            ret = powPos(x, n / 2)
            ret *= ret
            if n % 2 == 1:
                ret *= x
            return ret

        if n >= 0:
            return powPos(x, n)
        else:
            return 1 / powPos(x, -n)
