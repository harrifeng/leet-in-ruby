"""
Merge k sorted linked lists and return it as one sorted list.
Analyze and describe its complexity.
"""
import heapq
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
        c1 = li.get_list_from_array([1, 8, 9])
        s1 = [a1, b1, c1]
        r1 = li.get_list_from_array([1, 1, 2, 4, 8, 9, 14, 15, 16])
        self.assertListNodeEqual(r1, solution.mergeKLists(s1))
        a1 = li.get_list_from_array([2, 4, 16])
        b1 = li.get_list_from_array([1, 14, 15])
        c1 = li.get_list_from_array([1, 8, 9])
        s1 = [a1, b1, c1]
        r1 = li.get_list_from_array([1, 1, 2, 4, 8, 9, 14, 15, 16])
        self.assertListNodeEqual(r1, solution.mergeKListsMinQueue(s1))


class Solution(object):

    def mergeKLists(self, lists):
        """
        :type lists: List[ListNode]
        :rtype: ListNode
        """
        N = len(lists)
        if N == 0:
            return None
        if N == 1:
            return lists[0]

        return self.mergeTwoLists(self.mergeKLists(lists[:N / 2]),
                                  self.mergeKLists(lists[N / 2:]))

    def mergeKListsMinQueue(self, lists):
        """
        :type lists: List[ListNode]
        :rtype: ListNode
        """
        pq = []
        for i in lists:
            if i is not None:
                heapq.heappush(pq, (i.val, i))
        dummy = ListNode(-1)
        tmp = dummy
        while len(pq) > 0:
            val, cur = heapq.heappop(pq)
            dummy.next = cur
            dummy = dummy.next
            if cur.next is not None:
                heapq.heappush(pq, (cur.next.val, cur.next))

        return tmp.next

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
