"""
Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.
For example,
Given:
s1 = "aabcc",
s2 = "dbbca",
When s3 = "aadbbcbcac", return true.
When s3 = "aadbbbaccc", return false.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertTrue(solution.isInterleave("aabcc", "dbbca", "aadbbcbcac"))
        self.assertFalse(solution.isInterleave("aabcc", "dbbca", "aadbbbaccc"))


class Solution(object):

    def isInterleave(self, s1, s2, s3):
        """
        :type s1: str
        :type s2: str
        :type s3: str
        :rtype: bool
        """
        M = len(s1)
        N = len(s2)
        K = len(s3)
        if M + N != K:
            return False
        dp = [[False for j in range(N + 1)] for i in range(M + 1)]
        for i in range(M + 1):
            for j in range(N + 1):
                if i == 0 and j == 0:
                    dp[i][j] = True
                elif i > 0 and dp[i - 1][j] and s1[i - 1] == s3[i + j - 1]:
                    dp[i][j] = True
                elif j > 0 and dp[i][j - 1] and s2[j - 1] == s3[i + j - 1]:
                    dp[i][j] = True
                else:
                    dp[i][j] = False
        return dp[M][N]
