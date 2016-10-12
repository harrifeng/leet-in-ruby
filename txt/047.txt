"""
Given a collection of numbers that might contain duplicates, return all
possible unique permutations.
For example,
[1,1,2] have the following unique permutations:
[1,1,2], [1,2,1], and [2,1,1].
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(sorted([[1, 1, 2], [1, 2, 1], [2, 1, 1]]),
                         sorted(solution.permuteUnique([1, 1, 2])))


class Solution(object):

    def permuteUnique(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        def helper(nums, level, ret):
            if level == len(nums):
                ret.append(nums[:])
                return

            for i in range(level, len(nums)):
                if i == level or nums[i] not in nums[level:i]:
                    nums[level], nums[i] = nums[i], nums[level]
                    helper(nums, level + 1, ret)
                    nums[level], nums[i] = nums[i], nums[level]
        ret = []
        helper(sorted(nums), 0, ret)
        return ret
