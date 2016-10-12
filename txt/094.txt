"""
Given a binary tree, return the inorder traversal of its nodes' values.
For example:
Given binary tree {1,#,2,3},
   1
    \
     2
    /
   3
return [1,3,2].
Note: Recursive solution is trivial, could you do it iteratively?
"""

import unittest
import util.tree_node as tr
# from util.tree_node import TreeNode


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        root = tr.get_tree_from_array([1, 2, 3])
        self.assertEqual([2, 1, 3], solution.inorderTraversal(root))

        root2 = tr.get_tree_from_array([1, '#', 2, 3])
        self.assertEqual([1, 3, 2], solution.inorderTraversal(root2))


class Solution(object):

    def inorderTraversal(self, root):
        """
        :type root: TreeNode
        :rtype: List[int]
        """
        sta = []
        cur = root
        ret = []

        while cur is not None or len(sta) > 0:
            if cur is not None:
                sta.append(cur)
                cur = cur.left
            elif len(sta) > 0:
                # every node is put into the stack and visit its left node
                # in other words, every node pop from stack is the node whose
                # left node is already visited
                cur = sta.pop()
                ret.append(cur.val)
                cur = cur.right
        return ret
