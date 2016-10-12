"""
A message containing letters from A-Z is being encoded to numbers using the
following mapping:
'A' -> 1
'B' -> 2
...
'Z' -> 26
Given an encoded message containing digits, determine the total number of
ways to decode it.
For example,
Given encoded message "12", it could be decoded as "AB" (1 2) or "L" (12).
The number of ways decoding "12" is 2.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(3, solution.numDecodings("123"))
        self.assertEqual(0, solution.numDecodings("00"))
        self.assertEqual(1, solution.numDecodings("10"))
        self.assertEqual(1, solution.numDecodings("20"))
        self.assertEqual(1, solution.numDecodings("27"))
        self.assertEqual(1, solution.numDecodings("1"))
        self.assertEqual(0, solution.numDecodings("100"))
        self.assertEqual(1, solution.numDecodings("101"))
        self.assertEqual(1, solution.numDecodings("110"))
        self.assertEqual(0, solution.numDecodings("301"))
        self.assertEqual(0, solution.numDecodings("01"))
        self.assertEqual(0, solution.numDecodings("230"))


class Solution(object):

    def numDecodings(self, s):
        """
        :type s: str
        :rtype: int
        """
        N = len(s)
        if N == 0:
            return 0
        if s[0] == '0':
            return 0

        dp = [0] * (N + 1)
        dp[0] = 1
        dp[1] = 1

        for i in range(2, N + 1):
            if s[i - 1] == '0':
                if s[i - 2] == '1' or s[i - 2] == '2':
                    dp[i] = dp[i - 2]
                else:
                    dp[i] = 0
            else:
                if s[i - 2] == '0':
                    dp[i] = dp[i - 1]
                elif int(s[i - 2:i]) > 10 and int(s[i - 2:i]) <= 26:
                    dp[i] = dp[i - 2] + dp[i - 1]
                else:
                    dp[i] = dp[i - 1]
        return dp[N]
