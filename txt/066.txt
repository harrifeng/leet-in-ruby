"""
Given a non-negative number represented as an array of digits, plus one to the
number.
The digits are stored such that the most significant digit is at the head of
the list.
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual([1, 2, 4], solution.plusOne([1, 2, 3]))
        self.assertEqual([1, 0, 0, 0], solution.plusOne([9, 9, 9]))


class Solution(object):

    def plusOne(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        N = len(digits)

        i = N - 1
        while i >= 0:
            if digits[i] == 9:
                digits[i] = 0
                i -= 1
            else:
                digits[i] += 1
                return digits
        ret = [0] * (N + 1)
        ret[0] = 1
        return ret
