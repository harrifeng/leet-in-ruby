"""
Given an integer n, generate a square matrix filled with elements from 1 to n2
in spiral order.
For example,
Given n = 3,
You should return the following matrix:
[
 [ 1, 2, 3 ],
 [ 8, 9, 4 ],
 [ 7, 6, 5 ]
]
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual([[1, 2, 3], [8, 9, 4], [7, 6, 5]],
                         solution.generateMatrix(3))


class Solution(object):

    def generateMatrix(self, n):
        """
        :type n: int
        :rtype: List[List[int]]
        """
        ret = []
        beg_r = 0
        beg_c = 0
        end_r = n - 1
        end_c = n - 1

        ret = [[-1 for i in range(n)] for j in range(n)]

        count = 0
        while True:
            for i in range(beg_c, end_c + 1):
                count += 1
                ret[beg_r][i] = count
            beg_r += 1
            if beg_r > end_r:
                break
            for i in range(beg_r, end_r + 1):
                count += 1
                ret[i][end_c] = count
            end_c -= 1
            if beg_c > end_c:
                break
            for i in reversed(range(beg_c, end_c + 1)):
                count += 1
                ret[end_r][i] = count
            end_r -= 1
            if beg_r > end_r:
                break
            for i in reversed(range(beg_r, end_r + 1)):
                count += 1
                ret[i][beg_c] = count
            beg_c += 1
            if beg_c > end_c:
                break
        return ret
