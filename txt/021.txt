"""
Merge two sorted linked lists and return it as a new list. The new list
should be made by splicing together the nodes of the first two lists.
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
        a1 = li.get_list_from_array([2, 4, 16])
        b1 = li.get_list_from_array([1, 14, 15])
        r1 = li.get_list_from_array([1, 2, 4, 14, 15, 16])
        self.assertListNodeEqual(r1, solution.mergeTwoLists(a1, b1))


class Solution(object):

    def mergeTwoLists(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        dummy = ListNode(-1)
        tmp = dummy
        while l1 and l2:
            if l1.val < l2.val:
                dummy.next = l1
                l1 = l1.next
            else:
                dummy.next = l2
                l2 = l2.next
            dummy = dummy.next
        if l1:
            dummy.next = l1
        if l2:
            dummy.next = l2
        return tmp.next
