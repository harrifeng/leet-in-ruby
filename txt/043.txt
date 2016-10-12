"""
Given two numbers represented as strings, return multiplication of the numbers
as a string.
Note: The numbers can be arbitrarily large and are non-negative.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual("670592745", solution.multiply("12345", "54321"))


class Solution(object):

    def multiply(self, num1, num2):
        """
        :type num1: str
        :type num2: str
        :rtype: str
        """
        res = 0
        for i, bit_i in enumerate(num1[::-1]):
            num_i = int(bit_i) * (10 ** i)
            for j, bit_j in enumerate(num2[::-1]):
                num_j = int(bit_j) * (10 ** j)
                res += num_i * num_j
        return str(res)
