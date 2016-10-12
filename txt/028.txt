"""
Implement strStr().
Returns the index of the first occurrence of needle in haystack, or -1 if
needle is not part of haystack.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(3, solution.strStr("abcxyz", "xyz"))
        self.assertEqual(0, solution.strStr("abcde", "abc"))
        self.assertEqual(-1, solution.strStr("abcde", "cdew"))
        self.assertEqual(4, solution.strStr("mississippi", "issip"))


class Solution(object):

    def strStr(self, s, p):
        """
        :type t: str
        :type p: str
        :rtype: int
        """
        N = len(s)
        M = len(p)
        i, j = 0, 0
        pre = self.pre_arr(p)
        while i < N and j < M:
            if j == -1 or s[i] == p[j]:
                i += 1
                j += 1
            else:
                j = pre[j]
        if j == M:
            return i - j
        else:
            return -1

    def pre_arr(self, p):
        N = len(p)
        k, j = -1, 0
        pre = [-1] * N
        while j < N - 1:
            if k == -1 or p[j] == p[k]:
                j += 1
                k += 1
                pre[j] = k
            else:
                k = pre[k]
        return pre
