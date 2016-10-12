"""
Given a collection of intervals, merge all overlapping intervals.

For example,
Given [1,3],[2,6],[8,10],[15,18],
return [1,6],[8,10],[15,18].
"""
import unittest
import util.interval as inte
# from util.interval import Interval


class MyTest(unittest.TestCase):

    def assertIntervalEqual(self, l1, l2):
        self.assertEqual(len(l1), len(l2))
        l1 = sorted(l1)
        l2 = sorted(l2)

        N = len(l1)
        for i in range(N):
            self.assertEqual(l1[i].start, l2[i].start)
            self.assertEqual(l1[i].end, l2[i].end)

    def test(self):
        solution = Solution()
        a1 = inte.get_interval_list_from_listlist(
            [[1, 3], [2, 6], [8, 10], [15, 18]])
        r1 = inte.get_interval_list_from_listlist([[1, 6], [8, 10], [15, 18]])

        self.assertIntervalEqual(r1, solution.merge(a1))


class Solution(object):

    def merge(self, intervals):
        """
        :type intervals: List[Interval]
        :rtype: List[Interval]
        """
        N = len(intervals)
        if N <= 1:
            return intervals

        intervals = sorted(intervals, key=lambda x: x.start)
        ret = []
        prev = intervals[0]
        for inter in intervals[1:]:
            if inter.start <= prev.end:  # Can merge
                prev.end = max(prev.end, inter.end)
            else:
                ret.append(prev)
                prev = inter
        ret.append(prev)
        return ret
