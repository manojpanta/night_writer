require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test

  def test_if_it_exists
    nightwriter = NightWriter.new

    assert_instance_of NightWriter, nightwriter
  end

  def test_braille_length_for_one_letter
    
  end

  def test_it_can_translate_one_letter
    nightwriter = NightWriter.new

    assert_equal "0.....", nightwriter.get_braille_string("a")
  end

  def test_it_can_translate_two_letter
    nightwriter = NightWriter.new

    assert_equal "0.....0.0...", nightwriter.get_braille_string("ab")
  end

  def test_it_can_translate_two_letter_with_space_in_between
    nightwriter = NightWriter.new

    assert_equal "0...........0.0...", nightwriter.get_braille_string("a b")
  end

  def test_letter_a
    nightwriter = NightWriter.new
    nightwriter.get_braille_string("ab")
    nightwriter.splitting_into_brailles_in_hash
    assert_equal 1, nightwriter.brailles_in_hash.count
  end

  def test_if_it_works_for_multiple_letters
    nightwriter = NightWriter.new
    nightwriter.get_braille_string("abc")
    nightwriter.splitting_into_brailles_in_hash
    assert_equal 1, nightwriter.brailles_in_hash.count
  end
  def test_if_top_middle_and_bottom_row_has_correct_brailles
    nightwriter = NightWriter.new
    nightwriter.get_braille_string("ab")
    nightwriter.splitting_into_brailles_in_hash
    nightwriter.into_rows
  end

  def test_if_it_works_for_more_than_80_characters
    nightwriter = NightWriter.new
    input = "abaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    nightwriter.get_braille_string(input)
    nightwriter.splitting_into_brailles_in_hash
    assert_equal 2 , nightwriter.brailles_in_hash.count
    assert_equal 12, nightwriter.brailles_in_hash[2].length
    nightwriter.into_rows
    assert_equal 483, nightwriter.braille_splitted_in_lines[0].length
    assert_equal 15, nightwriter.braille_splitted_in_lines[1].length
    assert_nil nightwriter.braille_splitted_in_lines[2]
  end

  def test_print1
    nightwriter = NightWriter.new
    input = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    nightwriter.get_braille_string(input)
    nightwriter.splitting_into_brailles_in_hash
    nightwriter.into_rows
    puts  nightwriter.braille_splitted_in_lines
  end

  def test_for_capital_letter
    nightwriter = NightWriter.new
    assert_equal ".....00.....",nightwriter.get_braille_string("A")
  end

  def test_if_to_braille_string_works_for_two_capital_letters
    nightwriter = NightWriter.new
    assert_equal ".....00..........00.0...",nightwriter.get_braille_string("AB")
  end

  def test_if_to_braille_string_works_for_two_capital_letters_with_space
    nightwriter = NightWriter.new

    actual  = nightwriter.get_braille_string("A B")
    expected = ".....00................00.0..."

    assert_equal actual , expected
  end

  def test_for_a_word_mixed_with_upcase_and_lowercase_letters_with_space
    nightwriter = NightWriter.new

    actual = nightwriter.get_braille_string("My Nam")
    expected = ".....000..0.00.000...........000.00.0.....00..0."

    assert_equal expected, actual

  end



end
