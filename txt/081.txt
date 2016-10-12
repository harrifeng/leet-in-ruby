"""
Follow up for "Search in Rotated Sorted Array":
What if duplicates are allowed?
Would this affect the run-time complexity? How and why?
Write a function to determine if a given target is in the array.
"""

import unittest


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        self.assertTrue(solution.search([1, 3, 1, 1, 1], 3))


class Solution(object):

    def search(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: bool
        """
        N = len(nums)
        beg = 0
        end = N - 1

        while beg <= end:
            mid = (beg + end) / 2
            if nums[mid] == target:
                return True
            elif nums[beg] < nums[mid]:
                if nums[beg] <= target < nums[mid]:
                    end = mid - 1
                else:
                    beg = mid + 1
            elif nums[mid] < nums[end]:
                if nums[mid] < target and target <= nums[end]:
                    beg = mid + 1
                else:
                    end = mid - 1
            elif nums[beg] == nums[mid]:
                beg += 1
            else:  # nums[mid] == nums[end]:
                end -= 1

        return False
