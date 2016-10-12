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
        self.assertEqual("111", solution.addBinary("110", "1"))
        self.assertEqual("1001", solution.addBinary("110", "11"))


class Solution(object):

    def addBinary(self, a, b):
        """
        :type a: str
        :type b: str
        :rtype: str
        """
        adv = 0
        ret = []
        i, j = len(a) - 1, len(b) - 1
        while i >= 0 or j >= 0 or adv > 0:
            cnt = adv
            if i >= 0:
                cnt += int(a[i])
                i -= 1
            if j >= 0:
                cnt += int(b[j])
                j -= 1
            ret.insert(0, str(cnt % 2))
            adv = cnt / 2
        return ''.join(ret)
