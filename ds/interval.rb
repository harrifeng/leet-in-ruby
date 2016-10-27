# Definition for an interval.
class Interval
  attr_accessor :start, :end
  def initialize(s = 0, e = 0)
    @start = s
    @end = e
  end

  def self.get_interval_list_from_listlist(arr)
    ret = []
    arr.each do |a|
      one = Interval.new(a[0], a[1])
      ret.push one
    end
    ret
  end

  def self.two_intv_equal(intr1, intr2)
    return false if intr1.length != intr2.length
    intr1.length.times do |i|
      return false if (intr1[i].start != intr2[i].start) ||
                      (intr1[i].end != intr2[i].end)
    end
    true
  end
end
