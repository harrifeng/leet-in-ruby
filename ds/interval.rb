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
end
