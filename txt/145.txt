"""
Given a binary tree, return the postorder traversal of its nodes' values.
For example:
Given binary tree {1,#,2,3},
   1
    \
     2
    /
   3
return [3,2,1].
Note: Recursive solution is trivial, could you do it iteratively?
"""

import unittest
import util.tree_node as tr
# from util.tree_node import TreeNode


class MyTest(unittest.TestCase):

    def test(self):
        solution = Solution()
        root = tr.get_tree_from_array([1, 2, 3])
        self.assertEqual([2, 3, 1], solution.postorderTraversal(root))

        root2 = tr.get_tree_from_array([1, '#', 2, 3])
        self.assertEqual([3, 2, 1], solution.postorderTraversal(root2))

        root3 = tr.get_tree_from_array([3, 1, '#', '#', 2])
        self.assertEqual([2, 1, 3], solution.postorderTraversal(root3))


class Solution(object):

    def postorderTraversal(self, root):
        """
        :type root: TreeNode
        :rtype: List[int]
        """
        ret = []
        sta = []
        cur = root
        visited = {}
        while cur is not None or len(sta) > 0:
            if cur is not None:
                sta.append(cur)
                cur = cur.left
            else:
                cur = sta.pop()
                if cur.right is None or cur in visited:
                    ret.append(cur.val)
                    cur = None
                else:
                    sta.append(cur)
                    visited[cur] = True
                    cur = cur.right
        return ret
