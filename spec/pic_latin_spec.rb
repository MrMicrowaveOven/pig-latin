require_relative '../lib/pig_latin'

describe 'to_pig_latin' do
  it 'converts a word to pig latin' do
    expect(to_pig_latin('benjamin')).to eq('enjaminbay')
  end
  it 'converts a sentence to pig latin' do
    expect(to_pig_latin('benjamin ate the apple')).to eq('enjaminbay ateay hetay appleay')
  end
  it 'maintains capitalization' do
    expect(to_pig_latin('BenjAmin aTe the apPle')).to eq('EnjaMinbay aTeay hetay apPleay')
  end
  it 'maintains punctuation in the beginning or end of the word' do
    expect(to_pig_latin('!!BenjAmin.. aTe, the% apPle?')).to eq("!!EnjaMinbay.. aTeay, hetay% apPleay?")
  end
  it 'maintains spacing between words' do
    expect(to_pig_latin('!!BenjAmin..   aTe, the%   apPle?')).to eq("!!EnjaMinbay..   aTeay, hetay%   apPleay?")
  end
end

describe 'word_to_pig_latin' do
  it 'adds "ay" to the end if word begins with a vowel' do
    expect(word_to_pig_latin('apple')).to eq('appleay')
  end
  it 'if word begins with consonant, moves it to the end then adds "ay"' do
    expect(word_to_pig_latin('benjamin')).to eq('enjaminbay')
  end
  it 'maintains capitalization index' do
    expect(word_to_pig_latin("Benjamin")).to eq('Enjaminbay')
  end
  it 'maintains punctuation at beginning or end of word' do
    expect(word_to_pig_latin('!!BenjAmin..')).to eq('!!EnjaMinbay..')
  end
end

describe 'get_capitals_index_array' do
  it 'returns an empty array if word is lowercase' do
    expect(get_capitals_index_array('benjamin')).to eq([])
  end
  it 'returns an array of all capitalized letter indices' do
    expect(get_capitals_index_array('BenJamIn')).to eq([0, 3, 6])
  end
end

describe 'set_capitals' do
  it 'sets capitals on the word based on the indices' do
    expect(set_capitals('benjamin', [0, 3, 6])).to eq('BenJamIn')
  end
  it 'does nothing if passed an empty array' do
    expect(set_capitals('benjamin', [])).to eq('benjamin')
  end
end

describe 'is_capitalized' do
  it 'returns true if letter is capitalized' do
    expect(is_capitalized('Y')).to eq(true)
  end
  it 'returns false if letter is not capitalized' do
    expect(is_capitalized('y')).to eq(false)
  end
  it 'returns false if not given a letter' do
    expect(is_capitalized('+')).to eq(false)
  end
end
