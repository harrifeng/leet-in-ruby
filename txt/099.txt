"""
Two elements of a binary search tree (BST) are swapped by mistake.
Recover the tree without changing its structure.
Note:
A solution using O(n) space is pretty straight forward. Could you devise a
constant space solution?
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
        e1 = tr.get_tree_from_array([1, '#', 2])
        r1 = tr.get_tree_from_array([2, '#', 1])
        solution.recoverTree(r1)
        self.assertTreeNodeEqual(e1, r1)

        e2 = tr.get_tree_from_array([4, 2, 6, 1, 3, 5, 7])
        r2 = tr.get_tree_from_array([4, 2, 6, 1, 5, 3, 7])
        solution.recoverTree(r2)
        self.assertTreeNodeEqual(e2, r2)


class Solution(object):

    def recoverTree(self, root):
        """
        :type root: TreeNode
        :rtype: void Do not return anything, modify root in-place instead.
        """
        self.n1 = None
        self.n2 = None
        self.prev = None
        self.helper(root)
        self.n1.val, self.n2.val = self.n2.val, self.n1.val
        return

    def helper(self, root):
        if root:
            self.helper(root.left)
            if self.prev and self.prev.val > root.val:
                self.n2 = root
                if self.n1 is None:
                    self.n1 = self.prev
            self.prev = root
            self.helper(root.right)
