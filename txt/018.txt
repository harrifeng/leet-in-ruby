"""
Given an array S of n integers, are there elements a, b, c, and d in S such
that a + b + c + d = target? Find all unique quadruplets in the array which
gives the sum of target.

Note:
Elements in a quadruplet (a,b,c,d) must be in non-descending order.
(ie, a <= b <= c <= d)
The solution set must not contain duplicate quadruplets.
    For example, given array S = {1 0 -1 0 -2 2}, and target = 0.

    A solution set is:
    (-1,  0, 0, 1)
    (-2, -1, 1, 2)
    (-2,  0, 0, 2)
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(sorted([[-1, 0, 0, 1],
                                 [-2, -1, 1, 2],
                                 [-2, 0, 0, 2]]),
                         sorted(solution.fourSum([1, 0, -1, 0, -2, 2], 0)))


class Solution(object):

    def fourSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[List[int]]
        """
        nums = sorted(nums)
        N = len(nums)
        if N < 4:
            return []
        ret = []
        for i in range(N - 3):
            if i > 0 and nums[i] == nums[i - 1]:
                continue
            for j in range(i + 1, N - 2):
                if j > i + 1 and nums[j] == nums[j - 1]:
                    continue
                beg = j + 1
                end = N - 1
                while beg < end:
                    sum = nums[i] + nums[j] + nums[beg] + nums[end]
                    if sum == target:
                        ret.append([nums[i], nums[j], nums[beg], nums[end]])
                        while (beg < end and nums[beg] == nums[beg + 1] and
                               nums[end] == nums[end - 1]):
                            beg += 1
                            end -= 1
                        beg += 1
                        end -= 1
                    elif sum < target:
                        beg += 1
                    else:
                        end -= 1
        return ret
