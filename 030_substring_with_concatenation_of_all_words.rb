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
def find_substring(str, words)
  had_words = {}
  words.each do |word|
    had_words[word] += 1 if had_words.include?(word)
    had_words[word] = 1 unless had_words.include?(word)
  end

  ret = []
  word_len = words[0].length
  word_num = words.length
  (str.length + 1 - word_len * word_num).times do |i|
    curr = {}
    j = 0
    while j < word_num
      word = str[i + j * word_len, word_len]
      break unless had_words.include?(word)
      curr[word] += 1 if curr.include?(word)
      curr[word] = 1  unless curr.include?(word)

      break if curr[word] > had_words[word]
      j += 1
    end
    ret.push(i) if j == word_num
  end
  ret
end
