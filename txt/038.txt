"""
The count-and-say sequence is the sequence of integers beginning as follows:
1, 11, 21, 1211, 111221, ...

1 is read off as "one 1" or 11.
11 is read off as "two 1s" or 21.
21 is read off as "one 2, then one 1" or 1211.
Given an integer n, generate the nth sequence.
Note: The sequence of integers will be represented as a string.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        r1 = "1"
        r2 = "11"
        r3 = "21"
        r4 = "1211"
        r5 = "111221"
        self.assertEqual(r1, solution.countAndSay(1))
        self.assertEqual(r2, solution.countAndSay(2))
        self.assertEqual(r3, solution.countAndSay(3))
        self.assertEqual(r4, solution.countAndSay(4))
        self.assertEqual(r5, solution.countAndSay(5))


class Solution(object):

    def countAndSay(self, n):
        """
        :type n: int
        :rtype: str
        """
        if n == 1:
            return "1"
        s = self.countAndSay(n - 1) + "$"
        cnt = 1
        ret = ""
        N = len(s)
        for i in range(N - 1):
            if s[i] == s[i + 1]:
                cnt += 1
            else:
                ret += str(cnt)
                ret += str(s[i])
                cnt = 1
        return ret
