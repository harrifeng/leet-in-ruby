"""
Given n, how many structurally unique BST's (binary search trees) that store
values 1...n?
For example,
Given n = 3, there are a total of 5 unique BST's.
   1         3     3      2      1
    \       /     /      / \      \
     3     2     1      1   3      2
    /     /       \                 \
   2     1         2                 3
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(14, solution.numTrees(4))
        self.assertEqual(5, solution.numTrees(3))
        self.assertEqual(2, solution.numTrees(2))
        self.assertEqual(1, solution.numTrees(1))


class Solution(object):

    def numTrees(self, n):
        """
        :type n: int
        :rtype: int
        """
        dp = [0] * (n + 1)
        dp[0] = 1

        for i in range(1, n + 1):
            for j in range(i):
                dp[i] += dp[j] * dp[i - 1 - j]
        return dp[n]
