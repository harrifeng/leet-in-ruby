# frozen_string_literal: true
require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_005
    assert_equal 'abccba', longest_palindrome('abccbaaaa')
    assert_equal 'cc', longest_palindrome('ccd')
    assert_equal 'bb', longest_palindrome('abb')
    assert_equal 'a', longest_palindrome('a')
    assert_equal 'bcb', longest_palindrome('abcbe')
    assert_equal 'aaabaaa', longest_palindrome('aaabaaaa')
  end
end

# @param {String} s
# @return {String}
def longest_palindrome(s)
  t = '^#' + s.split('').join('#') + '#^'
  cnt = [0] * t.length
  tmpi_c = 0
  tmpi = 0
  maxi = 0
  maxv = 0

  1.upto(t.length - 2) do |i|
    cnt[i] = if i < tmpi
               [cnt[2 * tmpi_c - i], tmpi - i].min
             else
               1
             end

    cnt[i] += 1 while t[i + cnt[i]] == t[i - cnt[i]]

    if i + cnt[i] > tmpi
      tmpi = i + cnt[i]
      tmpi_c = i
    end

    if maxv < cnt[i]
      maxv = cnt[i]
      maxi = i
    end
  end

  s[maxi / 2 - maxv / 2, maxv - 1]
end
