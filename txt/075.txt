"""
Given an array with n objects colored red, white or blue, sort them so that
objects of the same color are adjacent, with the colors in the order red,
white and blue.
Here, we will use the integers 0, 1, and 2 to represent the color red, white,
and blue respectively.
Note:
You are not suppose to use the library's sort function for this problem.
"""
import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        r1 = [0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2]
        a1 = [0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 2, 2, 0, 2, 2]
        solution.sortColors(a1)
        self.assertEqual(r1, a1)

        r2 = [2, 2]
        a2 = [2, 2]
        solution.sortColors(a2)
        self.assertEqual(r2, a2)


class Solution(object):

    def sortColors(self, nums):
        """
        :type nums: List[int]
        :rtype: void Do not return anything, modify nums in-place instead.
        """
        N = len(nums)
        pre = -1
        back = N

        i = 0

        # There may be no 2s, in that case, i < N is easy to understand
        while i < back:
            if nums[i] == 0:
                pre += 1
                nums[pre], nums[i] = nums[i], nums[pre]
                i += 1
            elif nums[i] == 2:
                back -= 1
                nums[i], nums[back] = nums[back], nums[i]
            else:
                i += 1
        return
