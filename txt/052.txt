"""
Follow up for N-Queens problem.

Now, instead outputting board configurations, return the total number of
distinct solutions.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(len([['.Q..', '...Q', 'Q...', '..Q.'],
                              ['..Q.', 'Q...', '...Q', '.Q..']]),
                         solution.totalNQueens(4))
        self.assertEqual(len([['Q....', '..Q..', '....Q', '.Q...', '...Q.'],
                              ['Q....', '...Q.', '.Q...', '....Q', '..Q..'],
                              ['.Q...', '...Q.', 'Q....', '..Q..', '....Q'],
                              ['.Q...', '....Q', '..Q..', 'Q....', '...Q.'],
                              ['..Q..', 'Q....', '...Q.', '.Q...', '....Q'],
                              ['..Q..', '....Q', '.Q...', '...Q.', 'Q....'],
                              ['...Q.', 'Q....', '..Q..', '....Q', '.Q...'],
                              ['...Q.', '.Q...', '....Q', '..Q..', 'Q....'],
                              ['....Q', '.Q...', '...Q.', 'Q....', '..Q..'],
                              ['....Q', '..Q..', 'Q....', '...Q.', '.Q...']]),
                         solution.totalNQueens(5))


class Solution(object):

    def totalNQueens(self, n):
        """
        :type n: int
        :rtype: int
        """
        self.ret = 0

        def isValid(board, r, c):
            for i in range(r):
                for j in range(len(board[0])):
                    if board[i][j] == 'Q' and (j == c or
                                               abs(r - i) == abs(c - j)):
                        return False
            return True

        def helper(n, level, tmp):
            if level == n:
                self.ret += 1
                return

            line = '.' * n
            for i in range(n):
                newline = line[:i] + 'Q' + line[i + 1:]
                tmp.append(newline)
                if isValid(tmp, level, i):
                    helper(n, level + 1, tmp)
                tmp.pop()

        helper(n, 0, [])
        return self.ret
