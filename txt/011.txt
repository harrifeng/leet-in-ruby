"""
Given n non-negative integers a1, a2, ..., an, where each represents a point at
coordinate (i, ai). n vertical lines are drawn such that the two endpoints of
line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis
forms a container, such that the container contains the most water.

Note: You may not slant the container.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(0, solution.maxArea([1]))
        self.assertEqual(45, solution.maxArea(
            [1, 1, 2, 3, 4, 15, 4, 2, 19, 8]))


class Solution(object):

    def maxArea(self, height):
        """
        :type height: List[int]
        :rtype: int
        """
        if len(height) <= 1:
            return 0
        beg = 0
        end = len(height) - 1
        maxv, tmpv = 0, 0
        while beg < end:
            tmpv = (end - beg) * min(height[beg], height[end])
            maxv = max(maxv, tmpv)
            if height[end] < height[beg]:
                end -= 1
            else:
                beg += 1
        return maxv
