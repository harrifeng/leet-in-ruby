"""
Implement next permutation, which rearranges numbers into the lexicographically
next greater permutation of numbers.
If such arrangement is not possible, it must rearrange it as the lowest
possible order (ie, sorted in ascending order).
The replacement must be in-place, do not allocate extra memory.
Here are some examples. Inputs are in the left-hand column and its
corresponding outputs are in the right-hand column.
  1,2,3 -> 1,3,2
  3,2,1 -> 1,2,3
  1,1,5 -> 1,5,1
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        n1 = [1, 2, 3]
        r1 = [1, 3, 2]
        solution.nextPermutation(n1)
        self.assertEqual(r1, n1)

        n2 = [1, 3, 2]
        r2 = [2, 1, 3]
        solution.nextPermutation(n2)
        self.assertEqual(r2, n2)

        n3 = [3, 2, 1]
        r3 = [1, 2, 3]
        solution.nextPermutation(n3)
        self.assertEqual(r3, n3)


class Solution(object):

    def nextPermutation(self, nums):
        """
        :type nums: List[int]
        :rtype: void Do not return anything, modify nums in-place instead.
        """
        N = len(nums)
        if N == 0 or N == 1:
            return
        back = N - 2
        while back >= 0:
            if nums[back] < nums[back + 1]:
                break
            back -= 1
        if back == -1:
            nums.reverse()
            return

        j = N - 1
        while j > back:
            if nums[j] > nums[back]:
                break
            j -= 1
        nums[back], nums[j] = nums[j], nums[back]
        beg, end = back + 1, N - 1
        while beg < end:
            nums[beg], nums[end] = nums[end], nums[beg]
            beg += 1
            end -= 1
