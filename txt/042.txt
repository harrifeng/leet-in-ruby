"""
Given n non-negative integers representing an elevation map where the width of
each bar is 1, compute how much water it is able to trap after raining.

For example,
Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(6, solution.trap(
            [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]))


class Solution(object):

    def trap(self, height):
        """
        :type height: List[int]
        :rtype: int
        """
        N = len(height)
        if N < 3:
            return 0
        maxhi = height.index(max(height))

        ret = 0
        beg = 1
        tmph = height[0]
        while beg < maxhi:
            if height[beg] < tmph:
                ret += tmph - height[beg]
            else:
                tmph = height[beg]
            beg += 1

        end = N - 2
        tmph = height[-1]
        while end > maxhi:
            if height[end] < tmph:
                ret += tmph - height[end]
            else:
                tmph = height[end]
            end -= 1
        return ret
