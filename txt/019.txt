"""
Given a linked list, remove the nth node from the end of list and return its
head.
For example,
   Given linked list: 1->2->3->4->5, and n = 2.
   After removing the second node from the end, the linked list becomes
   1->2->3->5.
Note:
   Given n will always be valid.
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
        e1 = li.get_list_from_array([2, 4, 6])
        r1 = li.get_list_from_array([2, 6])
        n1 = 2

        self.assertListNodeEqual(r1, solution.removeNthFromEnd(e1, n1))

        solution = Solution()
        e2 = li.get_list_from_array([2, 4, 6])
        r2 = li.get_list_from_array([4, 6])
        n2 = 3

        self.assertListNodeEqual(r2, solution.removeNthFromEnd(e2, n2))


class Solution(object):

    def removeNthFromEnd(self, head, n):
        """
        :type head: ListNode
        :type n: int
        :rtype: ListNode
        """
        dummy = ListNode(-1)
        dummy.next = head

        fast = dummy
        slow = dummy
        for i in range(n):
            fast = fast.next
        while fast.next is not None:
            fast = fast.next
            slow = slow.next
        slow.next = slow.next.next
        return dummy.next
