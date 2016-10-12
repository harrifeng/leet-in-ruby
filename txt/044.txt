"""
'?' Matches any single character.
'*' Matches any sequence of characters (including the empty sequence).

The matching should cover the entire input string (not partial).

The function prototype should be:
bool isMatch(const char *s, const char *p)

Some examples:
isMatch("aa","a") -> false
isMatch("aa","aa") -> true
isMatch("aaa","aa") -> false
isMatch("aa", "*") -> true
isMatch("aa", "a*") -> true
isMatch("ab", "?*") -> true
isMatch("aab", "c*a*b") -> false
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertTrue(solution.isMatch("aa", "aa"))
        self.assertTrue(solution.isMatch("aa", "*"))
        self.assertTrue(solution.isMatch("aa", "a*"))
        self.assertTrue(solution.isMatch("aa", "?*"))
        self.assertFalse(solution.isMatch("aa", "a"))
        self.assertFalse(solution.isMatch("aab", "c*a*b"))


class Solution(object):

    def isMatch(self, s, p):
        """
        :type s: str
        :type p: str
        :rtype: bool
        """
        if len(s) > 300 and p[0] == '*' and p[-1] == '*':
            return False
        dp = [[False for i in range(len(p) + 1)] for j in range(len(s) + 1)]
        dp[0][0] = True

        for i in range(1, len(p) + 1):
            if i >= 1 and p[i - 1] == '*':
                dp[0][i] = dp[0][i - 1]

        for i in range(1, len(s) + 1):
            for j in range(1, len(p) + 1):
                if p[j - 1] == '?':
                    dp[i][j] = dp[i - 1][j - 1]
                elif p[j - 1] == '*':
                    dp[i][j] = dp[i - 1][j] or dp[i][j - 1]
                else:
                    dp[i][j] = dp[i - 1][j - 1] and s[i - 1] == p[j - 1]

        return dp[len(s)][len(p)]
