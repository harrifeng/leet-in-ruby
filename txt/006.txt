"""
The string "PAYPALISHIRING" is written in a zigzag pattern on a given number
of rows like this: (you may want to display this pattern in a fixed font for
better legibility)
P   A   H   N
A P L S I I G
Y   I   R
And then read line by line: "PAHNAPLSIIGYIR"
Write the code that will take a string and make this conversion given a number
of rows:
string convert(string text, int nRows);
For example:
  convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR"
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual("PAHNAPLSIIGYIR",
                         solution.convert("PAYPALISHIRING", 3))
        self.assertEqual("A",
                         solution.convert("A", 1))
        self.assertEqual("",
                         solution.convert("", 2))


class Solution(object):

    def convert(self, s, numRows):
        """
        :type s: str
        :type numRows: int
        :rtype: str
        """
        if numRows == 1:
            return s
        l = [""] * numRows
        group = 2 * numRows - 2
        for i, c in enumerate(s):
            cur = i % group
            if cur < numRows:
                l[cur] += c
            else:
                l[group - cur] += c

        return "".join(l)
