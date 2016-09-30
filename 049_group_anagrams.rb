require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_049
    assert_equal [%w(ate eat tea), %w(nat tan), ['bat']].sort,
                 group_anagrams(%w(eat tea tan ate nat bat)).sort
  end
end

def group_anagrams(strs)
  ret = {}
  strs.each do |str|
    ret[str_to_order(str)] = [] unless ret.include?(str_to_order(str))
    ret[str_to_order(str)].push(str)
  end
  ret.values.map(&:sort)
end

def str_to_order(str)
  str.split('').sort.join
end
