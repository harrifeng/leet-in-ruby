require 'minitest/autorun'

# MiniTest class
class MyTest < Minitest::Test
  def test_leet_068
    assert_equal [
      'This    is    an',
      'example  of text',
      'justification.  '
    ], full_justify(['This', 'is', 'an', 'example', 'of',
                     'text', 'justification.'], 16)
  end
end

def full_justify(words, max_width)
  ret = []
  cur = []
  cur_char_length = 0

  words.each_with_index do |word, _i|
    if word.length + cur.length + cur_char_length > max_width
      if cur.length == 1
        ret.push(fill_to_max(cur[0], max_width))
      else
        all_spaces = max_width - cur_char_length
        every_spaces = all_spaces / (cur.length - 1)
        extra_spaces = all_spaces % (cur.length - 1)

        extra_spaces.times do |i|
          cur[i] += ' '
        end
        ret.push(cur.join(' ' * every_spaces))
      end
      cur = []
      cur_char_length = 0
    end
    cur.push(word)
    cur_char_length += word.length
  end
  ret.push(fill_to_max(cur.join(' '), max_width))
  ret
end

def fill_to_max(str, max_width)
  str + ' ' * (max_width - str.length)
end
