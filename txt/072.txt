"""
Given two words word1 and word2, find the minimum number of steps required to
convert word1 to word2. (each operation is counted as 1 step.)
You have the following 3 operations permitted on a word:
a) Insert a character
b) Delete a character
c) Replace a character
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(2, solution.minDistance("abc", "fab"))


class Solution(object):

    def minDistance(self, word1, word2):
        M = len(word1)
        N = len(word2)
        dp = [[0 for j in range(N + 1)] for i in range(M + 1)]
        for i in range(M + 1):
            for j in range(N + 1):
                if i == 0:
                    dp[0][j] = j
                elif j == 0:
                    dp[i][0] = i
                elif word1[i - 1] == word2[j - 1]:
                    dp[i][j] = dp[i - 1][j - 1]
                else:
                    dp[i][j] = min(dp[i][j - 1],
                                   dp[i - 1][j],
                                   dp[i - 1][j - 1]) + 1
        return dp[M][N]
