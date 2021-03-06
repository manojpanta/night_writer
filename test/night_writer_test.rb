require_relative 'test_helper'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  def test_if_it_exists
    nightwriter = NightWriter.new

    assert_instance_of NightWriter, nightwriter
  end

  def test_braille_length_for_one_letter
    nightwriter = NightWriter.new

    nightwriter.get_braille_string('a')

    assert_equal 6, nightwriter.brailles.length
  end

  def test_braille_length_for_two_letter
    nightwriter = NightWriter.new

    nightwriter.get_braille_string('ab')

    assert_equal 12, nightwriter.brailles.length
  end

  def test_braille_length_for_a_word
    nightwriter = NightWriter.new

    nightwriter.get_braille_string('word')

    assert_equal 24, nightwriter.brailles.length
  end

  def test_braille_length_for_a_sentence_with_spaces
    nightwriter = NightWriter.new

    nightwriter.get_braille_string('word is word')

    assert_equal 72, nightwriter.brailles.length
  end

  def test_it_can_translate_one_letter
    nightwriter = NightWriter.new

    assert_equal '0.....', nightwriter.get_braille_string('a')
  end

  def test_it_can_translate_two_letter
    nightwriter = NightWriter.new

    assert_equal '0.....0.0...', nightwriter.get_braille_string('ab')
  end

  def test_it_can_translate_two_letter_with_space_in_between
    nightwriter = NightWriter.new

    assert_equal '0...........0.0...', nightwriter.get_braille_string('a b')
  end

  def test_it_can_translate_two_letter_with_capital_letter_with_space_in_between
    nightwriter = NightWriter.new

    result = '.....00...........0.0...'

    assert_equal result, nightwriter.get_braille_string('A b')
  end

  def test_it_can_store_into_hash
    nightwriter = NightWriter.new

    nightwriter.get_braille_string('ab')

    nightwriter.splitting_into_brailles_in_hash

    assert_equal '0.....0.0...', nightwriter.brailles_in_hash[1]

    assert_equal 1, nightwriter.brailles_in_hash.count
  end

  def test_if_it_works_for_multiple_letters
    nightwriter = NightWriter.new
    nightwriter.get_braille_string('abc')

    nightwriter.splitting_into_brailles_in_hash

    assert_equal '0.....0.0...00....', nightwriter.brailles_in_hash[1]

    assert_equal 1, nightwriter.brailles_in_hash.count
  end

  def test_it_creates_a_new_hash_for_input_longer_than_80_characters
    nightwriter = NightWriter.new

    input1 = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    input2 = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    input = input1.concat(input2)

    nightwriter.get_braille_string(input)

    nightwriter.splitting_into_brailles_in_hash

    assert_equal 3, nightwriter.brailles_in_hash.count
  end

  def test_if_it_works_for_more_than_80_characters
    nightwriter = NightWriter.new

    input1 = 'abaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    input2 = 'aaaaaaaaaaaaaaaaa'

    input = input1.concat(input2)
    nightwriter.get_braille_string(input)
    nightwriter.splitting_into_brailles_in_hash

    assert_equal 3, nightwriter.brailles_in_hash.count
    assert_equal 240, nightwriter.brailles_in_hash[2].length
    assert_equal 240, nightwriter.brailles_in_hash[1].length

    nightwriter.into_rows

    assert_equal 243, nightwriter.braille_splitted_in_lines[0].length
    assert_equal 243, nightwriter.braille_splitted_in_lines[1].length

    assert "0.0.\n....\n....\n", nightwriter.braille_splitted_in_lines[2]
  end

  def test_into_row_method_changes_braille_splitted_in_lines_variable
    nightwriter = NightWriter.new

    input1 = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    input2 = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    input = input1.concat(input2)

    nightwriter.get_braille_string(input)
    nightwriter.splitting_into_brailles_in_hash
    nightwriter.into_rows

    assert_equal 3, nightwriter.braille_splitted_in_lines.length
  end

  def test_get_braille_string_method_for_capital_letter
    nightwriter = NightWriter.new
    assert_equal '.....00.....', nightwriter.get_braille_string('A')
  end

  def test_get_braille_string_method_works_for_two_capital_letters
    nightwriter = NightWriter.new

    result = '.....00..........00.0...'

    assert_equal result, nightwriter.get_braille_string('AB')
  end

  def test_if_get_braille_string_method_for_two_capital_letters_with_space
    nightwriter = NightWriter.new

    actual = nightwriter.get_braille_string('A B')
    expected = '.....00................00.0...'

    assert_equal actual, expected
  end

  def test_for_a_word_mixed_with_upcase_and_lowercase_letters_with_space
    nightwriter = NightWriter.new

    input1 = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    input2 = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    input = input1.concat(input2)

    nightwriter.get_braille_string(input)
    nightwriter.splitting_into_brailles_in_hash
    nightwriter.into_rows

    assert_equal 3, nightwriter.brailles_in_hash.length
    nightwriter.braille_splitted_in_lines
  end
end
