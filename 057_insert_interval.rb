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

  def test_leet_057
    a1 = Interval.get_interval_list_from_listlist([[1, 2], [3, 5], [6, 7],
                                                   [8, 10], [12, 16]])
    r1 = Interval.get_interval_list_from_listlist([[1, 2], [3, 10], [12, 16]])
    assert_interval_array_equal r1, insert(a1, Interval.new(4, 9))
  end
end

# @param {Interval[]} intervals
# @param {Interval} new_interval
# @return {Interval[]}
def insert(intervals, new_interval)
  intervals.sort! { |x, y| x.start <=> y.start }

  ret = []
  inserted = false
  intervals.each do |interval|
    if new_interval.start > interval.end
      ret.push interval
    elsif new_interval.end < interval.start
      unless inserted
        ret.push new_interval
        inserted = true
      end
      ret.push interval

    else
      new_interval.start = [new_interval.start, interval.start].min
      new_interval.end = [new_interval.end, interval.end].max
    end
  end

  ret.push(new_interval) unless inserted
  ret
end
