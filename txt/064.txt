"""
Given a m x n grid filled with non-negative numbers, find a path from top left
to bottom right which minimizes the sum of all numbers along its path.
Note: You can only move either down or right at any point in time.
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(3, solution.minPathSum([[1, 2], [1, 1]]))


class Solution(object):

    def minPathSum(self, grid):
        """
        :type grid: List[List[int]]
        :rtype: int
        """
        m = len(grid)
        if m == 0:
            return 0
        n = len(grid[0])

        for i in range(1, m):
            grid[i][0] += grid[i - 1][0]

        for i in range(1, n):
            grid[0][i] += grid[0][i - 1]

        for i in range(1, m):
            for j in range(1, n):
                grid[i][j] += min(grid[i][j - 1], grid[i - 1][j])

        return grid[m - 1][n - 1]
