"""
Given n pairs of parentheses, write a function to generate all combinations
of well-formed parentheses.
For example, given n = 3, a solution set is:
"((()))", "(()())", "(())()", "()(())", "()()()"
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(["((()))", "(()())", "(())()", "()(())", "()()()"],
                         solution.generateParenthesis(3))


class Solution(object):

    def generateParenthesis(self, n):
        """
        :type n: int
        :rtype: List[str]
        """
        ret = []
        self.helper(n, n, "", ret)
        return ret

    def helper(self, left, right, tmp, ret):
        if left == 0 and right == 0:
            ret.append(tmp[:])
            return
        # Same with the loop in the Phone Number problem
        if left > 0:
            self.helper(left - 1, right, tmp + '(', ret)
        if right > left:
            self.helper(left, right - 1, tmp + ')', ret)
