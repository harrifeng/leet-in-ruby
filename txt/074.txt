"""
Write an efficient algorithm that searches for a value in an m x n matrix.
This matrix has the following properties:
Integers in each row are sorted from left to right.
The first integer of each row is greater than the last integer of the previous
row.
For example,
Consider the following matrix:
[
  [1,   3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
]
Given target = 3, return true.
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(True, solution.searchMatrix(
            [[1,   3,  5,  7],  [10, 11, 16, 20],  [23, 30, 34, 50]], 3))


class Solution(object):

    def searchMatrix(self, matrix, target):
        """
        :type matrix: List[List[int]]
        :type target: int
        :rtype: bool
        """
        m = len(matrix)
        if m == 0:
            return False

        beg = 0
        end = m - 1

        while beg <= end:
            mid = (beg + end) / 2
            if target in matrix[mid]:
                return True
            if target < matrix[mid][0]:
                end = mid - 1
            else:
                beg = mid + 1
        return False
