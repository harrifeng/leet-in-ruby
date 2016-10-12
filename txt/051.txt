"""
Given an integer n, return all distinct solutions to the n-queens puzzle.

Each solution contains a distinct board configuration of the n-queens'
placement, where 'Q' and '.' both indicate a queen and an empty space
respectively.

For example,
There exist two distinct solutions to the 4-queens puzzle:

[
 [".Q..",  // Solution 1
  "...Q",
  "Q...",
  "..Q."],

 ["..Q.",  // Solution 2
  "Q...",
  "...Q",
  ".Q.."]
]
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual([['.Q..', '...Q', 'Q...', '..Q.'],
                          ['..Q.', 'Q...', '...Q', '.Q..']],
                         solution.solveNQueens(4))
        self.assertEqual([['Q....', '..Q..', '....Q', '.Q...', '...Q.'],
                          ['Q....', '...Q.', '.Q...', '....Q', '..Q..'],
                          ['.Q...', '...Q.', 'Q....', '..Q..', '....Q'],
                          ['.Q...', '....Q', '..Q..', 'Q....', '...Q.'],
                          ['..Q..', 'Q....', '...Q.', '.Q...', '....Q'],
                          ['..Q..', '....Q', '.Q...', '...Q.', 'Q....'],
                          ['...Q.', 'Q....', '..Q..', '....Q', '.Q...'],
                          ['...Q.', '.Q...', '....Q', '..Q..', 'Q....'],
                          ['....Q', '.Q...', '...Q.', 'Q....', '..Q..'],
                          ['....Q', '..Q..', 'Q....', '...Q.', '.Q...']],
                         solution.solveNQueens(5))


class Solution(object):

    def solveNQueens(self, n):
        """
        :type n: int
        :rtype: List[List[str]]
        """
        def isValid(queen, r, c):
            for i in range(r):
                for j in range(len(queen[0])):
                    if queen[i][j] == 'Q' and (j == c or
                                               abs(r - i) == abs(c - j)):
                        return False
            return True

        def helper(n, level, tmp, ret):
            if level == n:
                ret.append(tmp[:])
                return
            line = '.' * n
            for i in range(n):
                ch_line = line[:i] + 'Q' + line[i + 1:]
                tmp.append(ch_line)
                if isValid(tmp, level, i):
                    helper(n, level + 1, tmp, ret)
                tmp.pop()

        ret = []
        helper(n, 0, [], ret)
        return ret
