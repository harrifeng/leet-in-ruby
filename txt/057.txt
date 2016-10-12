"""
Given a set of non-overlapping intervals, insert a new interval into the
intervals (merge if necessary).
You may assume that the intervals were initially sorted according to their
start times.
Example 1:
Given intervals [1,3],[6,9], insert and merge [2,5] in as [1,5],[6,9].
Example 2:
Given [1,2],[3,5],[6,7],[8,10],[12,16], insert and merge [4,9] in as
[1,2],[3,10],[12,16].
This is because the new interval [4,9] overlaps with [3,5],[6,7],[8,10].
"""
import unittest
import util.interval as inte
from util.interval import Interval


class MyTest(unittest.TestCase):

    def assertIntervalEqual(self, l1, l2):
        self.assertEqual(len(l1), len(l2))
        l1 = sorted(l1, key=lambda x: x.start)
        l2 = sorted(l2, key=lambda x: x.start)

        N = len(l1)
        for i in range(N):
            self.assertEqual(l1[i].start, l2[i].start)
            self.assertEqual(l1[i].end, l2[i].end)

    def test(self):
        solution = Solution()
        a1 = inte.get_interval_list_from_listlist([[1, 3], [6, 9]])
        n1 = Interval(2, 5)
        r1 = inte.get_interval_list_from_listlist([[1, 5], [6, 9]])

        self.assertIntervalEqual(r1, solution.insert(a1, n1))

        a2 = inte.get_interval_list_from_listlist([[1, 5]])
        n2 = Interval(2, 3)
        r2 = inte.get_interval_list_from_listlist([[1, 5]])

        self.assertIntervalEqual(r2, solution.insert(a2, n2))

        a3 = inte.get_interval_list_from_listlist([[1, 5]])
        n3 = Interval(0, 6)
        r3 = inte.get_interval_list_from_listlist([[0, 6]])

        self.assertIntervalEqual(r3, solution.insert(a3, n3))


class Solution(object):

    def insert(self, intervals, newInterval):
        """
        :type intervals: List[Interval]
        :type newInterval: Interval
        :rtype: List[Interval]
        """
        res = []
        inserted = False
        for inter in intervals:
            if newInterval.end < inter.start:
                if not inserted:
                    res.append(newInterval)
                    inserted = True
                res.append(inter)
            elif inter.end < newInterval.start:
                res.append(inter)
            else:
                newInterval.start = min(newInterval.start, inter.start)
                newInterval.end = max(newInterval.end, inter.end)

        if not inserted:
            res.append(newInterval)
        return res
