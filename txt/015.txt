"""
Given an array S of n integers, are there elements a, b, c in S such that
a + b + c = 0? Find all unique triplets in the array which gives the sum of
zero.
Note:
    Elements in a triplet (a,b,c) must be in non-descending order.
    (ie, a <= b <= c)
    The solution set must not contain duplicate triplets.
    For example, given array S = {-1 0 1 2 -1 -4},
    A solution set is:
    (-1, 0, 1)
    (-1, -1, 2)
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(sorted([[-1, 0, 1], [-1, -1, 2]]),
                         sorted(solution.threeSum([-1, 0, 1, 2, -1, 4])))


class Solution(object):

    def threeSum(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        nums = sorted(nums)
        N = len(nums)
        ret = []
        for i in range(N - 2):
            if i > 0 and nums[i] == nums[i - 1]:
                continue
            beg = i + 1
            end = N - 1
            while beg < end:
                cnt = nums[i] + nums[beg] + nums[end]
                if cnt == 0:
                    ret.append([nums[i], nums[beg], nums[end]])
                    while (beg < end and nums[beg] == nums[beg + 1] and
                           nums[end] == nums[end - 1]):
                        beg += 1
                        end -= 1
                    beg += 1
                    end -= 1
                elif cnt < 0:
                    beg += 1
                else:
                    end -= 1

        return ret
