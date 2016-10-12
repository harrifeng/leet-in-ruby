"""
Given a sorted linked list, delete all nodes that have duplicate numbers,
leaving only distinct numbers from the original list.
For example,
Given 1->2->3->3->4->4->5, return 1->2->5.
Given 1->1->1->2->3, return 2->3.
"""

import unittest
import util.list_node as li
from util.list_node import ListNode


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
        e1 = li.get_list_from_array([1, 2, 5])
        a1 = li.get_list_from_array([1, 2, 3, 3, 4, 4, 5])

        self.assertListNodeEqual(e1, solution.deleteDuplicates(a1))

        solution = Solution()
        e2 = li.get_list_from_array([])
        a2 = li.get_list_from_array([1, 1])

        self.assertListNodeEqual(e2, solution.deleteDuplicates(a2))


class Solution(object):

    def deleteDuplicates(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        if head is None or head.next is None:
            return head

        dummy = ListNode(-1)
        dummy.next = head
        ###############################################################
        # like remove duplicate from array, pre is the last valid one #
        # and pre.next == cur means the left-side OK one              #
        ###############################################################
        pre = dummy
        cur = head

        while cur.next is not None:
            if cur.val != cur.next.val:  # right-side ok
                if pre.next == cur:      # if left-side ok, add one to result
                    pre = pre.next
                else:
                    pre.next = cur.next  # left-side not ok, new start
            cur = cur.next

        if pre.next == cur:     # cur is the last one, add it to result
            pre = pre.next
        pre.next = None
        return dummy.next
