"""
Given a string containing only digits, restore it by returning all possible
valid IP address combinations.
For example:
Given "25525511135",
return ["255.255.11.135", "255.255.111.35"]. (Order does not matter)
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(sorted(["255.255.11.135", "255.255.111.35"]),
                         sorted(solution.restoreIpAddresses("25525511135")))
        self.assertEqual(sorted(["0.10.0.10", "0.100.1.0"]),
                         sorted(solution.restoreIpAddresses("010010")))


class Solution(object):

    def restoreIpAddresses(self, s):
        """
        :type s: str
        :rtype: List[str]
        """
        def helper(s, tmp, ret):
            if len(tmp) > 4:
                return
            if len(s) == 0 and len(tmp) == 4:
                ret.append('.'.join(tmp))
                return

            for i in range(1, min(len(s) + 1, 4)):
                if (i > 1 and s[0] == '0') or (i == 3 and int(s[:3]) > 255):
                    continue
                tmp.append(s[:i])
                helper(s[i:], tmp, ret)
                tmp.pop()
        ret = []
        helper(s, [], ret)
        return ret
