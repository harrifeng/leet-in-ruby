"""
Given an array of strings, group anagrams together.
For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"],
Return:
[
  ["ate", "eat","tea"],
  ["nat","tan"],
  ["bat"]
]
Note:
    For the return value, each inner list's elements must follow the
    lexicographic order.
    All inputs will be in lower-case.
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(sorted([["ate", "eat", "tea"],  ["nat", "tan"],
                                 ["bat"]]),
                         sorted(solution.groupAnagrams(
                             ["eat", "tea", "tan", "ate", "nat", "bat"])))


class Solution(object):

    def groupAnagrams(self, strs):
        """
        :type strs: List[str]
        :rtype: List[List[str]]
        """
        d = {}
        for s in strs:
            key = ''.join(sorted(s))
            d.setdefault(key, []).append(s)
        ret = []
        for v in d.values():
            ret.append(sorted(v))
        return ret
