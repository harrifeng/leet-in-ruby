require 'minitest/autorun'
require_relative 'ds/interval'

# MiniTest class
class MyTest < Minitest::Test
  def assert_interval_array_equal(a1, a2)
    assert_equal a1.length, a2.length

    a1.length.times do |i|
      assert_equal a1[i].start, a2[i].start
      assert_equal a1[i].end, a2[i].end
    end
  end

  def test_leet_056
    a1 = Interval.get_interval_list_from_listlist(
      [[1, 3], [2, 6], [8, 10], [15, 18]]
    )
    r1 = Interval.get_interval_list_from_listlist([[1, 6], [8, 10], [15, 18]])
    assert_interval_array_equal(r1, merge(a1))
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
