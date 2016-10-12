"""
Given an integer, convert it to a roman numeral.
Input is guaranteed to be within the range from 1 to 3999.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual("I", solution.intToRoman(1))
        self.assertEqual("IV", solution.intToRoman(4))
        self.assertEqual("VII", solution.intToRoman(7))
        self.assertEqual("CD", solution.intToRoman(400))
        self.assertEqual("MMCCCXLV", solution.intToRoman(2345))


class Solution(object):

    def intToRoman(self, num):
        """
        :type num: int
        :rtype: str
        """
        digits = [(1000, 'M'),
                  (900, 'CM'), (500, 'D'), (400, 'CD'), (100, 'C'),
                  (90, 'XC'), (50, 'L'), (40, 'XL'), (10, 'X'),
                  (9, 'IX'), (5, 'V'), (4, 'IV'), (1, 'I')]

        ret = ""
        for digit in digits:
            while num >= digit[0]:
                ret += digit[1]
                num -= digit[0]
            if num == 0:
                break
        return ret
