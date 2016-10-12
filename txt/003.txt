"""
Given a string, find the length of the longest substring without repeating
characters.
For example:
  The longest substring without repeating letters for "abcabcbb" is "abc",
  which the length is 3.
  For "bbbbb" the longest substring is "b", with the length of 1.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(3, solution.lengthOfLongestSubstring("abcabcbb"))
        self.assertEqual(1, solution.lengthOfLongestSubstring("bbbbb"))
        self.assertEqual(2, solution.lengthOfLongestSubstring("abba"))
        #################################################################
        # This example demostrate that start is bigger than d[char] + 1 #
        #################################################################
        self.assertEqual(3, solution.lengthOfLongestSubstring("abcba"))


class Solution(object):

    def lengthOfLongestSubstring(self, s):
        """
        :type s: str
        :rtype: int
        """
        start = 0
        max_len = 0
        d = {}
        for i, char in enumerate(s):
            if char in d:
                start = max(start, d[char] + 1)
            d[char] = i
            max_len = max(max_len, i - start + 1)
        return max_len
