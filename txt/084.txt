"""
Given n non-negative integers representing the histogram's bar height where
the width of each bar is 1, find the area of largest rectangle in the
histogram.
                              6
                            +---+
                          5 |   |
                        +---+---+
                        |   |   |
                        +---+---+
                        |   |   |     3
                        +---+---+   +---+
                  2     |   |   | 2 |   |
                +---+   +---+---+---+---+
                |   | 1 |   |   |   |   |
                +---+---+---+---+---+---+
                |   |   |   |   |   |   |
                +---+---+---+---+---+---+
Above is a histogram where width of each bar is 1,
given height = [2,1,5,6,2,3].
                              6
                            +---+
                          5 |///|
                        +---+---+
                        |///|///|
                        +---+---+
                        |///|///|     3
                        +---+---+   +---+
                  2     |///|///| 2 |   |
                +---+   +---+---+---+---+
                |   | 1 |///|///|   |   |
                +---+---+---+---+---+---+
                |   |   |///|///|   |   |
                +---+---+---+---+---+---+


The largest rectangle is shown in the shaded area, which has area = 10 unit.
For example,
Given heights = [2,1,5,6,2,3],
return 10.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(10, solution.largestRectangleArea([2, 1, 5, 6, 2, 3]))


class Solution(object):

    def largestRectangleArea(self, heights):
        """
        :type heightss: List[int]
        :rtype: int
        """
        # append 0 to the end, used to find the last
        heights.append(0)
        N = len(heights)
        stack = []
        max_area = 0
        i = 0
        while i < N:
            if len(stack) == 0 or heights[i] >= heights[stack[-1]]:
                stack.append(i)
                i += 1
            else:
                # h = heights[index]
                index = stack.pop()
                if len(stack) == 0:
                    # range [0, i) include 0, exclude i
                    width = i
                else:
                    # range (stack[-1], i) exclude stack[-1], exclude i
                    width = i - stack[-1] - 1
                max_area = max(max_area, width * heights[index])
        return max_area
"""
                              8
                            +---+
                          7 |///|
                        +---+---+
                      6 |///|///|
                    +---+---+---+
                  5 |///|///|///|
                +---+---+---+---+
                |///|///|///|///|
                +---+---+---+---+
                |///|///|///|///| 3
                +---+---+---+---+---+
                |///|///|///|///|///|
                +---+---+---+---+---+
                |///|///|///|///|///|
                +---+---+---+---+---+
                |///|///|///|///|///|
                +---+---+---+---+---+
See the height [5, 6, 7, 8, 3], the 3 is smaller than everyone before it,
so we can use one-pass to calculate the biggest part before 3, and the value
will NOT influence other parts.
That's why we add the 0 to the end, it will help us to calculate all before
that.
"""
