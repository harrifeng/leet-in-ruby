# frozen_string_literal: true
require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_059
    assert_equal [[1, 2, 3], [8, 9, 4], [7, 6, 5]], generate_matrix(3)
  end
end

# @param {Integer} n
# @return {Integer[][]}
def generate_matrix(n)
  ret = Array.new(n) { Array.new(n, 0) }

  head_r = 0
  tail_r = n - 1
  head_c = 0
  tail_c = n - 1

  cnt = 1
  loop do
    head_c.upto(tail_c) do |col|
      ret[head_r][col] = cnt
      cnt += 1
    end
    head_r += 1
    break if head_r > tail_r

    head_r.upto(tail_r) do |row|
      ret[row][tail_c] = cnt
      cnt += 1
    end
    tail_c -= 1
    break if head_c > tail_c

    tail_c.downto(head_c) do |col|
      ret[tail_r][col] = cnt
      cnt += 1
    end
    tail_r -= 1
    break if head_r > tail_r

    tail_r.downto(head_r) do |row|
      ret[row][head_c] = cnt
      cnt += 1
    end
    head_c += 1
    break if head_c > tail_c
  end

  ret
end
