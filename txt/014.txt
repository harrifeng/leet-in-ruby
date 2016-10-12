"""
Given a roman numeral, convert it to an integer.
Input is guaranteed to be within the range from 1 to 3999.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual("ab", solution.longestCommonPrefix(["abcd", "abccc",
                                                             "abb"]))
        self.assertEqual("wab", solution.longestCommonPrefix(["wabcd", "wab"]))


class Solution(object):

    def longestCommonPrefix(self, strs):
        """
        :type strs: List[str]
        :rtype: str
        """
        N = len(strs)
        if N == 0:
            return ""
        ret = strs[0]
        for i in range(len(ret)):
            for str in strs[1:]:
                if len(str) == i or str[i] != ret[i]:
                    return ret[:i]
        return ret
