"""
Given n, generate all structurally unique BST's (binary search trees) that
store values 1...n.

For example,
Given n = 3, your program should return all 5 unique BST's shown below.

   1         3     3      2      1
    \       /     /      / \      \
     3     2     1      1   3      2
    /     /       \                 \
   2     1         2                 3
"""

import unittest
import util.tree_node as tr
from util.tree_node import TreeNode


class MyTest(unittest.TestCase):

    def assertTreeNodeEqual(self, t1, t2):
        if t1:
            self.assertEqual(t1.val, t2.val)
            if t1.left:
                self.assertTreeNodeEqual(t1.left, t2.left)
            if t2.left:
                self.assertTreeNodeEqual(t1.right, t2.right)

    def test(self):
        solution = Solution()
        e1 = []
        e1.append(tr.get_tree_from_array([1, '#', 2]))
        e1.append(tr.get_tree_from_array([2, 1]))
        r1 = solution.generateTrees(2)
        # sorted function need to be improved
        # e1 = sorted(e1)
        # r1 = sorted(solution.generateTrees(2))
        self.assertEqual(len(e1), len(r1))
        for i, c in enumerate(e1):
            self.assertTreeNodeEqual(c, r1[i])


class Solution(object):

    def generateTrees(self, n):
        """
        :type n: int
        :rtype: List[TreeNode]
        """
        if n == 0:
            return []

        def helper(arr):
            if len(arr) == 0:
                return [None]
            ret = []
            for i in range(0, len(arr)):
                left = helper(arr[:i])
                right = helper(arr[i + 1:])

                for j in left:
                    for k in right:
                        dummy = TreeNode(arr[i])
                        dummy.left = j
                        dummy.right = k
                        ret.append(dummy)
            return ret

        nums = [i for i in range(1, n + 1)]
        return helper(nums)
