"""
Determine if a Sudoku is valid
The Sudoku board could be partially filled, where empty cells are filled with
the character '.'.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        pa1 = ["..9748...", "7........", ".2.1.9...", "..7...24.",
               ".64.1.59.", ".98...3..", "...8.3.2.", "........6", "...2759.."]
        a1 = []
        for i in pa1:
            a1.append(list(i))

        pr1 = ["519748632", "783652419", "426139875", "357986241",
               "264317598", "198524367", "975863124", "832491756", "641275983"]
        r1 = []
        for i in pr1:
            r1.append(list(i))

        solution.solveSudoku(a1)
        self.assertEqual(r1, a1)


class Solution:
    # @param board, a 9x9 2D array
    # Solve the Sudoku by modifying the input board in-place.
    # Do not return any value.

    def solveSudoku(self, board):
        def isValid(x, y):
            tmp = board[x][y]
            board[x][y] = 'D'
            for i in range(9):
                if board[i][y] == tmp:
                    return False
            for i in range(9):
                if board[x][i] == tmp:
                    return False
            for i in range(3):
                for j in range(3):
                    if board[(x / 3) * 3 + i][(y / 3) * 3 + j] == tmp:
                        return False
            board[x][y] = tmp
            return True

        def dfs(board):
            for i in range(9):
                for j in range(9):
                    if board[i][j] == '.':
                        for k in '123456789':
                            board[i][j] = k
                            if isValid(i, j) and dfs(board):
                                return True
                            board[i][j] = '.'
                        return False
            return True
        dfs(board)
