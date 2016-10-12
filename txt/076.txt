"""
Given a string S and a string T, find the minimum window in S which will
contain all the characters in T in complexity O(n).
For example,
S = "ADOBECODEBANC"
T = "ABC"
Minimum window is "BANC".
Note:
If there is no such window in S that covers all characters in T, return the
empty string "".
If there are multiple such windows, you are guaranteed that there will always
be only one unique minimum window in S.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual("BANC", solution.minWindow("ADOBECODEBANC", "ABC"))


class Solution(object):

    def minWindow(self, S, T):
        """
        :type s: str
        :type t: str
        :rtype: str
        """
        m = len(S)
        n = len(T)
        dic = [0] * 256
        cnt = [0] * 256

        for c in T:
            dic[ord(c)] += 1
            cnt[ord(c)] += 1

        start = 0
        minV = m + 1
        left = start

        for i in range(m):
            if dic[ord(S[i])] > 0:
                cnt[ord(S[i])] -= 1
                if cnt[ord(S[i])] >= 0:
                    n -= 1
            if n == 0:
                while start <= i:
                    if dic[ord(S[start])] > 0:
                        if cnt[ord(S[start])] < 0:  # left ptr can move on
                            cnt[ord(S[start])] += 1
                        else:
                            break
                    start += 1
                if i - start + 1 < minV:
                    minV = i - start + 1
                    left = start
        if minV != m + 1:
            return S[left:left+minV]
        return ""
