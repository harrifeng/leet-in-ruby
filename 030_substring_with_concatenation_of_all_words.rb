require 'minitest/autorun'

# Test for solution
class MyTest < Minitest::Test
  def test_leet_030
    assert_equal [0, 9], find_substring('barfoothefoobarman', %w(foo bar))
    assert_equal [0, 3], find_substring('barfooabcbarthefoobarman',
                                        %w(foo bar abc))
  end
end

# @param {String} s
# @param {String[]} words
# @return {Integer[]}
def find_substring(s, words)
  return [] if words.length.zero?
  had_word = words.group_by { |v| v }

  arr_len = words.length
  word_len = words[0].length
  ret = []
  0.upto(s.length - arr_len * word_len) do |i|
    curr = {}
    j = 0
    while j < arr_len
      word = s[i + j * word_len, word_len]
      break unless had_word.include?(word)
      curr[word] = (curr[word] || 0)  + 1
      break if curr[word] > had_word[word].length
      j += 1
    end
    ret.push(i) if j == arr_len
  end
  ret
end
