"""
Determine whether an integer is a palindrome. Do this without extra space.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertTrue(solution.isPalindrome(12321))
        self.assertFalse(solution.isPalindrome(12300))
        self.assertTrue(solution.isPalindrome(1324231))
        self.assertFalse(solution.isPalindrome(-1324231))


class Solution(object):

    def isPalindrome(self, x):
        """
        :type x: int
        :rtype: bool
        """
        if x < 0:
            return False
        tmp = x
        size = 1
        while tmp > 9:
            size *= 10
            tmp /= 10

        while size > 9:
            if x / size != x % 10:
                return False
            x = x % size / 10
            size /= 100
        return True
