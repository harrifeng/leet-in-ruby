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
  helper_059(n, 0)
end

def helper_059(n, count)
  return [] if n.zero?
  return [[count + 1]] if n == 1

  matrix = Array.new(n) { Array.new(n, 0) }

  matrix[0].map!.with_index {|v, i| (i == matrix[0].length-1) ? v : (count += 1) }

  matrix[0...-1].map do |line|
    count += 1
    line[-1] = count
    line
  end

  tmp = matrix[-1][1..-1].reverse.map { count += 1 }
  matrix[-1][1..-1] = tmp.reverse

  matrix[1..-1].reverse.map do |line|
    count += 1
    line[0] = count
    line
  end

  inner = helper_059(n - 2, count)
  n.times do |i|
    n.times do |j|
      matrix[i][j] = inner[i - 1][j - 1] if matrix[i][j].zero?
    end
  end
  matrix
end
