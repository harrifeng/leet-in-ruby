"""
Given a 2D board and a word, find if the word exists in the grid.
The word can be constructed from letters of sequentially adjacent cell, where
"adjacent" cells are those horizontally or vertically neighboring. The same
letter cell may not be used more than once.
For example,
Given board =
[
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]
word = "ABCCED", -> returns true,
word = "SEE", -> returns true,
word = "ABCB", -> returns false.
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        b1 = [
            ['A', 'B', 'C', 'E'],
            ['S', 'F', 'C', 'S'],
            ['A', 'D', 'E', 'E']
        ]
        self.assertTrue(solution.exist(b1, "ABCCED"))
        b1 = [
            ['A', 'B', 'C', 'E'],
            ['S', 'F', 'C', 'S'],
            ['A', 'D', 'E', 'E']
        ]
        self.assertTrue(solution.exist(b1, "SEE"))
        b1 = [
            ['A', 'B', 'C', 'E'],
            ['S', 'F', 'C', 'S'],
            ['A', 'D', 'E', 'E']
        ]
        self.assertFalse(solution.exist(b1, "ABCB"))


class Solution(object):

    def exist(self, board, word):
        """
        :type board: List[List[str]]
        :type word: str
        :rtype: bool
        """
        M = len(board)
        N = len(board[0])
        for i in range(M):
            for j in range(N):
                if (board[i][j] == word[0] and
                        self.isWord(board, i, j, 0, word)):
                    return True
        return False

    def isWord(self, board, i, j, index, word):
        if index == len(word):
            return True

        M = len(board)
        N = len(board[0])

        if i < 0 or i >= M or j < 0 or j >= N or board[i][j] != word[index]:
            return False

        board[i][j] = '#'
        if self.isWord(board, i + 1, j, index + 1, word) or \
                self.isWord(board, i - 1, j, index + 1, word) or \
                self.isWord(board, i, j + 1, index + 1, word) or \
                self.isWord(board, i, j - 1, index + 1, word):
            return True

        board[i][j] = word[index]

        return False
