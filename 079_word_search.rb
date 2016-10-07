require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_079
    b1 = [
      %w(A B C E),
      %w(S F C S),
      %w(A D E E)
    ]
    assert exist(b1, 'ABCCED')

    b2 =
      [%w(aaa abb abb bbb bbb
          aaa bbb abb aab aba)]
    assert !exist(b2, 'aabaaaabbb')
  end
end

# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  return false if board.length.zero?
  m = board.length
  n = board[0].length

  m.times do |i|
    n.times do |j|
      return true if (board[i][j] == word[0]) && is_word?(board, i, j, 0, word)
    end
  end
  false
end

def is_word?(board, i, j, index, word)
  return true if index == word.length
  m = board.length
  n = board[0].length

  return false if i < 0 || i >= m || (j >= n) || (board[i][j] != word[index])

  board[i][j] = '#'

  return true if is_word?(board, i + 1, j, index + 1, word) ||
                 is_word?(board, i - 1, j, index + 1, word) ||
                 is_word?(board, i, j + 1, index + 1, word) ||
                 is_word?(board, i, j - 1, index + 1, word)

  board[i][j] = word[index]
  false
end
