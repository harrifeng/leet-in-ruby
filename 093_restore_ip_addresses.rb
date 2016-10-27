require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_093
    assert_equal ['255.255.11.135', '255.255.111.35'].sort,
                 restore_ip_addresses('25525511135')
    assert_equal ['0.10.0.10', '0.100.1.0'].sort, restore_ip_addresses('010010')
  end
end

# @param {String} s
# @return {String[]}
def restore_ip_addresses(s)
  ret = []
  helper_093(s, 0, [], ret)
  ret
end

def helper_093(s, level, tmp, ret)
  if level == 4 && s.length.zero?
    ret.push tmp.join('.')
    return
  end

  if level > 4
    return
  end

  [s.length,3].min.times do |i|
    cur_s = s.slice(0, i + 1)
    next if (cur_s[0] == '0' && cur_s.length > 1) || cur_s.to_i > 256
    tmp.push(cur_s)
    helper_093(s[cur_s.length...s.length], level + 1, tmp, ret)
    tmp.pop
  end
end
