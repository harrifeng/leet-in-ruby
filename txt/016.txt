"""
Given an array S of n integers, find three integers in S such that the sum
is closest to a given number, target. Return the sum of the three integers.
You may assume that each input would have exactly one solution.
    For example, given array S = {-1 2 1 -4}, and target = 1.
    The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(2, solution.threeSumClosest([-1, 2, 1, -4], 1))


class Solution(object):

    def threeSumClosest(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        nums = sorted(nums)
        N = len(nums)
        if N < 3:
            return 0
        mint = sum(nums[:3])
        for i in range(N - 2):
            beg = i + 1
            end = N - 1
            while beg < end:
                cnt = nums[i] + nums[beg] + nums[end]
                if abs(cnt - target) < abs(mint - target):
                    mint = cnt
                if cnt == target:
                    return cnt
                elif cnt < target:
                    beg += 1
                else:
                    end -= 1
        return mint
