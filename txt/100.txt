"""
Given two binary trees, write a function to check if they are equal or not.
Two binary trees are considered equal if they are structurally identical and
the nodes have the same value.
"""

import unittest
import util.tree_node as tr
# from util.tree_node import TreeNode


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
        self.assertTrue(solution.isSameTree(
            tr.get_tree_from_array([2, '#', 1]),
            tr.get_tree_from_array([2, '#', 1])))
        self.assertFalse(solution.isSameTree(
            tr.get_tree_from_array([1, '#', 2]),
            tr.get_tree_from_array([2, '#', 1])))


class Solution(object):

    def isSameTree(self, p, q):
        """
        :type p: TreeNode
        :type q: TreeNode
        :rtype: bool
        """
        if p is None and q is None:
            return True
        if p is None or q is None:
            return False
        return (p.val == q.val) and \
            self.isSameTree(p.left, q.left) and \
            self.isSameTree(p.right, q.right)
