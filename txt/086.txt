"""
Given a linked list and a value x, partition it such that all nodes less than x
come before nodes greater than or equal to x.
You should preserve the original relative order of the nodes in each of the two
partitions.
For example,
Given 1->4->3->2->5->2 and x = 3,
return 1->2->2->4->3->5.
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
        e1 = li.get_list_from_array([1, 2, 2, 4, 3, 5])
        x1 = 3
        a1 = li.get_list_from_array([1, 4, 3, 2, 5, 2])

        self.assertListNodeEqual(e1, solution.partition(a1, x1))


class Solution(object):

    def partition(self, head, x):
        """
        :type head: ListNode
        :type x: int
        :rtype: ListNode
        """
        small = ListNode(-1)
        tmpS = small

        big = ListNode(-1)
        tmpB = big

        if head is None or head.next is None:
            return head

        while head is not None:
            if head.val < x:
                small.next = head
                small = small.next
            else:
                big.next = head
                big = big.next
            head = head.next
        big.next = None
        small.next = tmpB.next
        return tmpS.next
