# Move first constenant to the end
# If vowel, leave alone.
# Then add "ay" at the end.
# Allow sentences with a single space in between words
# Maintain the index of case.
# Maintain the index of punctuation (beginning or end of word)

VOWELS = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']

def to_pig_latin(sentence)
  words = sentence.split(/\s/)
  # Run each word through word_to_pig_latin
  pl_array = words.map do |word|
    word.empty? ? '' : word_to_pig_latin(word)
  end

  # Rejoin into string split by spaces
  pl_array.join(' ')
end

def is_capitalized(letter)
  !letter.scan(/[A-Z]/).empty?
end

def get_capitals_index_array(word)
  caps = []
  word.chars.each_with_index do |letter, index|
    caps << index if is_capitalized(letter)
  end
  caps
end

def set_capitals(word, capitals_index_array)
  capped_word = ''
  # Loop through each letter
  word.chars.each_with_index do |char, index|
  # If the index of the letter is in capitals_index_array, capitalize it
  # Either way, concatenate to capped_word
    capped_word += capitals_index_array.include?(index) ? char.upcase : char
  end
  capped_word
end


def word_to_pig_latin(word)
  # Any non-letters followed by a letter
  left_punctuation = word.scan(/\A[^a-zA-Z]*/).first
  # Any non-letters following a letter
  right_punctuation = word.scan(/[^a-zA-Z]*\z/).first

  unpunctuated_word = word.gsub(left_punctuation, '')
                          .gsub(right_punctuation, '')

  # Save capitals
  capitals_index_array = get_capitals_index_array(unpunctuated_word)
  # If first letter is not a vowel, shift and push the letter.
  pl_word = unpunctuated_word.downcase
  chars = pl_word.chars
  first_letter = chars[0]

  if !VOWELS.include?(first_letter)
    chars.shift
    chars.push(first_letter)
    pl_word = chars.join
  end

  pl_word = set_capitals(pl_word, capitals_index_array)

  # Add "ay" to the end, along with any previous punctuation.
  "#{left_punctuation}#{pl_word}ay#{right_punctuation}"
end
