"""
Given a sorted linked list, delete all duplicates such that each element appear
only once.
For example,
Given 1->1->2, return 1->2.
Given 1->1->2->3->3, return 1->2->3.
"""

import unittest
import util.list_node as li
# from util.list_node import ListNode


class MyTest(unittest.TestCase):

    def assertListNodeEqual(self, l1, l2):
        while l1 is not None and l2 is not None:
            self.assertEqual(l1.val, l2.val)
            l1 = l1.next
            l2 = l2.next
        self.assertIsNone(l1)
        self.assertIsNone(l2)

    def test(self):
        solution = Solution()
        e1 = li.get_list_from_array([1, 2])
        a1 = li.get_list_from_array([1, 1, 2])

        self.assertListNodeEqual(e1, solution.deleteDuplicates(a1))

        e2 = li.get_list_from_array([1, 2, 3])
        a2 = li.get_list_from_array([1, 1, 2, 2, 3])

        self.assertListNodeEqual(e2, solution.deleteDuplicates(a2))


class Solution(object):

    def deleteDuplicates(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        if head is None or head.next is None:
            return head

        cur = head
        while cur.next is not None:
            if cur.val == cur.next.val:
                cur.next = cur.next.next
            else:
                cur = cur.next
        return head
