"""
Given a linked list, reverse the nodes of a linked list k at a time and return
its modified list.
If the number of nodes is not a multiple of k then left-out nodes in the end
should remain as it is.
You may not alter the values in the nodes, only nodes itself may be changed.
Only constant memory is allowed.
For example,
  Given this linked list: 1->2->3->4->5
  For k = 2, you should return: 2->1->4->3->5
  For k = 3, you should return: 3->2->1->4->5
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
        a1 = li.get_list_from_array([1, 2, 3, 4])
        r1 = li.get_list_from_array([2, 1, 4, 3])
        self.assertListNodeEqual(r1, solution.reverseKGroup(a1, 2))

        a2 = li.get_list_from_array([1, 2, 3, 4, 5])
        r2 = li.get_list_from_array([3, 2, 1, 4, 5])
        self.assertListNodeEqual(r2, solution.reverseKGroup(a2, 3))


class Solution(object):

    def reverseKGroup(self, head, k):
        """
        :type head: ListNode
        :type k: int
        :rtype: ListNode
        """
        if k == 1:
            return head
        tmp = head
        for i in range(k):
            if tmp is None:
                return head
            tmp = tmp.next

        dummy = ListNode(-1)
        dummy.next = head
        tmp = head
        for i in range(k):
            cur = head
            head = head.next
            cur.next = dummy.next
            dummy.next = cur
        tmp.next = self.reverseKGroup(head, k)
        return dummy.next
