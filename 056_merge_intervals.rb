# frozen_string_literal: true
require 'minitest/autorun'
require_relative 'ds/interval'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_056
    a1 = Interval.get_interval_list_from_listlist(
      [[1, 3], [2, 6], [8, 10], [15, 18]]
    )
    r1 = Interval.get_interval_list_from_listlist([[1, 6], [8, 10], [15, 18]])
    assert Interval.two_intv_equal(r1, merge(a1))
  end
end

# @param {Interval[]} intervals
# @return {Interval[]}
def merge(intervals)
  ret = []
  return ret if intervals.length.zero?

  intervals.sort! { |x, y| x.start <=> y.start }
  cur = intervals[0]
  intervals[1..-1].each do |interval|
    if cur.end >= interval.start
      cur.end = [cur.end, interval.end].max
    else
      ret.push cur
      cur = interval
    end
  end
  ret.push cur
  ret
end
