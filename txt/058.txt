"""
Given a string s consists of upper/lower-case alphabets and empty space
characters ' ', return the length of last word in the string.
If the last word does not exist, return 0.
Note: A word is defined as a character sequence consists of non-space
characters only.
For example,
Given s = "Hello World",
return 5.
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(5, solution.lengthOfLastWord("Hello World"))
        self.assertEqual(1, solution.lengthOfLastWord(" a b "))


class Solution(object):

    def lengthOfLastWord(self, s):
        """
        :type s: str
        :rtype: int
        """
        ns = s.strip()
        N = len(ns)
        if N == 0:
            return 0

        last = N - 1
        while last >= 0:
            if ns[last] == ' ':
                break
            last -= 1
        return N - 1 - last
