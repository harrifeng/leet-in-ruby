"""
Given a matrix of m x n elements (m rows, n columns), return all elements of
the matrix in spiral order.
For example,
Given the following matrix:
[
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]
You should return [1,2,3,6,9,8,7,4,5].
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual([1, 2, 3, 6, 9, 8, 7, 4, 5], solution.spiralOrder(
            [[1, 2, 3], [4, 5, 6], [7, 8, 9]]))


class Solution(object):

    def spiralOrder(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: List[int]
        """
        lr = len(matrix)
        if lr == 0:
            return []
        lc = len(matrix[0])

        beg_r = 0
        end_r = lr - 1
        beg_c = 0
        end_c = lc - 1

        ret = []
        while True:
            for i in range(beg_c, end_c + 1):
                ret.append(matrix[beg_r][i])
            beg_r += 1
            if beg_r > end_r:
                break
            for i in range(beg_r, end_r + 1):
                ret.append(matrix[i][end_c])
            end_c -= 1
            if beg_c > end_c:
                break
            for i in reversed(range(beg_c, end_c + 1)):
                ret.append(matrix[end_r][i])
            end_r -= 1
            if beg_r > end_r:
                break
            for i in reversed(range(beg_r, end_r + 1)):
                ret.append(matrix[i][beg_c])
            beg_c += 1
            if beg_c > end_c:
                break
        return ret
