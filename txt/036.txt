"""
Determine if a Sudoku is valid
The Sudoku board could be partially filled, where empty cells are filled with
the character '.'.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertTrue(solution.isValidSudoku([".87654321",
                                                "2........",
                                                "3........",
                                                "4........",
                                                "5........",
                                                "6........",
                                                "7........",
                                                "8........",
                                                "9........"]))


class Solution(object):

    def isValidSudoku(self, board):
        """
        :type board: List[List[str]]
        :rtype: bool
        """
        r = [[False for i in range(9)] for j in range(9)]
        c = [[False for i in range(9)] for j in range(9)]
        g = [[False for i in range(9)] for j in range(9)]

        for i in range(9):
            for j in range(9):
                if board[i][j] != '.':
                    cur = int(board[i][j]) - 1
                    if r[i][cur] or c[j][cur] or g[i / 3 * 3 + j / 3][cur]:
                        return False

                    r[i][cur] = True
                    c[j][cur] = True
                    g[i / 3 * 3 + j / 3][cur] = True
        return True
