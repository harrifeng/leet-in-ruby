require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_076
    assert_equal('BANC', min_window('ADOBECODEBANC', 'ABC'))
  end
end

# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  m = s.length
  n = t.length

  dic = {}
  256.times { |i| dic[i.chr] = 0 }
  cnt = dic.dup

  t.each_char do |c|
    dic[c] += 1
    cnt[c] += 1
  end

  start = 0
  minv = m + 1
  left = start
  s.chars.each_with_index do |c, i|
    if dic[c] > 0
      cnt[c] -= 1
      n -= 1 if cnt[c] >= 0
    end
    next unless n.zero?
    # s[start..i] is now the largest solution
    while start <= i
      if dic[s[start]] > 0
        if cnt[s[start]] < 0
          cnt[s[start]] += 1
        else
          break
        end
      end
      start += 1
    end
    if i - start + 1 < minv
      minv = i - start + 1
      left = start
    end
  end

  return s[left, minv] if minv != m + 1
  ''
end
