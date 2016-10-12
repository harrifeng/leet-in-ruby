"""
Given a sorted array, remove the duplicates in place such that each element
appear only once and return the new length.
Do not allocate extra space for another array, you must do this in place with
constant memory.
For example,
Given input array nums = [1,1,2],
Your function should return length = 2, with the first two elements of nums
being 1 and 2 respectively. It doesn't matter what you leave beyond the new
length.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertEqual(3, solution.removeDuplicates([1, 2, 3]))
        self.assertEqual(2, solution.removeDuplicates([1, 2, 2]))
        self.assertEqual(1, solution.removeDuplicates([1, 1, 1]))


class Solution(object):

    def removeDuplicates(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        N = len(nums)
        if N < 2:
            return N
        pre = 0
        for i in range(1, N):
            if nums[i] != nums[i - 1]:
                pre += 1
                nums[pre] = nums[i]
        return pre + 1
