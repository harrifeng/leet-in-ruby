"""
You are given two linked lists representing two non-negative numbers. The
digits are stored in reverse order and each of their nodes contain a single
digit. Add the two numbers and return it as a linked list.

Definition for singly-linked list.
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

For example:
  Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
  Output: 7 -> 0 -> 8
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
        a1 = li.get_list_from_array([1, 2, 3])
        b1 = li.get_list_from_array([1, 2, 3])

        self.assertListNodeEqual(e1, solution.addTwoNumbers(a1, b1))

        e2 = li.get_list_from_array([7, 0, 8])
        a2 = li.get_list_from_array([2, 4, 3])
        b2 = li.get_list_from_array([5, 6, 4])

        self.assertListNodeEqual(e2, solution.addTwoNumbers(a2, b2))


class Solution(object):

    def addTwoNumbers(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        dummy = ListNode(0)
        carry = 0
        cur = dummy
        while l1 is not None or l2 is not None or carry > 0:
            cnt = carry
            if l1 is not None:
                cnt += l1.val
                l1 = l1.next
            if l2 is not None:
                cnt += l2.val
                l2 = l2.next
            cur.next = ListNode(cnt % 10)
            carry = cnt / 10
            cur = cur.next
        return dummy.next
