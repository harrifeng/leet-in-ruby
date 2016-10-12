"""
You are climbing a stair case. It takes n steps to reach to the top.
Each time you can either climb 1 or 2 steps. In how many distinct ways can you
climb to the top?
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        m1 = [
            [1, 2, 3],
            [4, 0, 6],
            [7, 8, 9]
        ]

        r1 = [
            [1, 0, 3],
            [0, 0, 0],
            [7, 0, 9]
        ]
        solution.setZeroes(m1)

        self.assertEqual(r1, m1)


class Solution(object):

    def setZeroes(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: void Do not return anything, modify matrix in-place instead.
        """
        M = len(matrix)
        if M == 0:
            return
        N = len(matrix[0])

        rZero = False
        cZero = False

        for i in range(M):
            for j in range(N):
                if matrix[i][j] == 0:
                    if i == 0:
                        rZero = True
                    if j == 0:
                        cZero = True
                    matrix[0][j] = 0
                    matrix[i][0] = 0

        for i in range(1, M):
            for j in range(1, N):
                if matrix[i][0] == 0 or matrix[0][j] == 0:
                    matrix[i][j] = 0

        if rZero:
            for i in range(N):
                matrix[0][i] = 0

        if cZero:
            for i in range(M):
                matrix[i][0] = 0
        return
