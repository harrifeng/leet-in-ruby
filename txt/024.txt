"""
Given a linked list, swap every two adjacent nodes and return its head.
For example,
Given 1->2->3->4, you should return the list as 2->1->4->3.

Your algorithm should use only constant space. You may not modify the values in
the list, only nodes itself can be changed.
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
        self.assertListNodeEqual(r1, solution.swapPairs(a1))


class Solution(object):

    def swapPairs(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        if head is None or head.next is None:
            return head

        dummy = ListNode(-1)
        dummy.next = head
        tmp = head
        for i in range(2):
            cur = head
            head = head.next
            cur.next = dummy.next
            dummy.next = cur
        tmp.next = self.swapPairs(head)
        return dummy.next
