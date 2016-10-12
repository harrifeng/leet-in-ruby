"""
You are given an n x n 2D matrix representing an image.
Rotate the image by 90 degrees (clockwise).
Follow up:
Could you do this in-place?
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        m1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        solution.rotate(m1)
        self.assertEqual([[7, 4, 1], [8, 5, 2], [9, 6, 3]], m1)


class Solution(object):

    def rotate(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: void Do not return anything, modify matrix in-place instead.
        """
        N = len(matrix[0])
        if N == 0:
            return
        for i in range(N):
            for j in range(N):
                if i > j:
                    matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]

        for i in range(N):
            for j in range(N / 2):
                matrix[i][j], matrix[i][
                    N - j - 1] = matrix[i][N - j - 1], matrix[i][j]

        return
