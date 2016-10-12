"""
Follow up for "Remove Duplicates":
What if duplicates are allowed at most twice?
For example,
Given sorted array nums = [1,1,1,2,2,3],
Your function should return length = 5, with the first five elements of nums
being 1, 1, 2, 2 and 3. It doesn't matter what you leave beyond the new length.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        a1 = [1, 1, 1, 2, 2, 3]
        r1 = [1, 1, 2, 2, 3]
        t1 = solution.removeDuplicates(a1)
        self.assertEqual(r1, a1[:t1])

        a1 = [1, 1, 1, 1, 3, 3]
        r1 = [1, 1, 3, 3]
        t1 = solution.removeDuplicates(a1)
        self.assertEqual(r1, a1[:t1])


class Solution(object):

    def removeDuplicates(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        N = len(nums)
        if N <= 2:
            return N
        pre = 0
        size = 0
        for i in range(1, N):
            if nums[i] != nums[i - 1]:
                pre += 1
                nums[pre] = nums[i]
                size = 0
            else:
                if size == 0:
                    pre += 1
                    nums[pre] = nums[i]
                size += 1
        return pre + 1
