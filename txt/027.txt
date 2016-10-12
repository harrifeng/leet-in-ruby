"""
Given an array and a value, remove all instances of that value in place and
return the new length.
Do not allocate extra space for another array, you must do this in place with
constant memory.
The order of elements can be changed. It doesn't matter what you leave beyond
the new length.
Example:
  Given input array nums = [3,2,2,3], val = 3
Your function should return length = 2, with the first two elements of nums
being 2.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        a1 = [3, 2, 2, 3]
        n1 = 2
        r1 = [2, 2]
        self.assertEqual(n1, solution.removeElement(a1, 3))
        self.assertEqual(r1, a1[:n1])


class Solution(object):

    def removeElement(self, nums, val):
        """
        :type nums: List[int]
        :type val: int
        :rtype: int
        """
        N = len(nums)
        if N == 0:
            return 0
        pre = -1
        for i in range(N):
            if nums[i] != val:
                pre += 1
                nums[pre] = nums[i]
        return pre + 1
