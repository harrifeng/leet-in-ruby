"""
Given a 2D binary matrix filled with 0's and 1's, find the largest rectangle
containing all ones and return its area.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(6, solution.maximalRectangle(
            [['0', '0', '0', '0'],
             ['1', '1', '1', '1'],
             ['1', '1', '1', '0'],
             ['0', '1', '0', '0']]
        ))


class Solution(object):

    def maximalRectangle(self, matrix):
        """
        :type matrix: List[List[str]]
        :rtype: int
        """
        m = len(matrix)
        if m == 0:
            return 0
        n = len(matrix[0])

        max_area = 0
        heights = [0] * n
        for i in range(m):
            for j in range(n):
                if matrix[i][j] == "0":
                    heights[j] = 0
                else:
                    heights[j] += 1
            max_area = max(max_area, self.helper(heights))
        return max_area

    def helper(self, heights):
        heights.append(0)
        i = 0
        maxv = 0
        sta = []
        while i < len(heights):
            if len(sta) == 0 or heights[i] >= heights[sta[-1]]:
                sta.append(i)
                i += 1
            else:
                index = sta.pop()
                if len(sta) == 0:
                    width = i
                else:
                    width = i - sta[-1] - 1
                maxv = max(maxv, width * heights[index])
        return maxv
