"""
Given a list, rotate the list to the right by k places, where k is
non-negative.
For example:
Given 1->2->3->4->5->NULL and k = 2,
return 4->5->1->2->3->NULL.
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
        a1 = li.get_list_from_array([1, 2, 3, 4, 5])
        r1 = li.get_list_from_array([4, 5, 1, 2, 3])
        self.assertListNodeEqual(r1, solution.rotateRight(a1, 2))


class Solution(object):

    def rotateRight(self, head, k):
        """
        :type head: ListNode
        :type k: int
        :rtype: ListNode
        """
        if head is None or head.next is None:
            return head

        cur = head
        L = 1
        while cur.next is not None:
            cur = cur.next
            L += 1

        cur.next = head  # previous is NULL

        size = L - k % L
        dummy = ListNode(-1)
        dummy.next = head

        for i in range(size):
            dummy = dummy.next

        ret = dummy.next
        dummy.next = None
        return ret
