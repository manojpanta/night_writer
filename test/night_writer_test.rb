require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'


class NightWriterTest < Minitest::Test

  def test_if_it_exists
    nightwriter = NightWriter.new

    assert_instance_of NightWriter, nightwriter
  end

  def test_it_can_translate_one_letter

    nightwriter = NightWriter.new

    assert_equal "0.....", nightwriter.get_braille_string("a")
  end

  def test_it_can_translate_two_letter
    skip
    nightwriter = NightWriter.new

    assert_equal "0.....0.0...", nightwriter.get_braille_string("ab")
  end

  def test_it_can_translate_two_letter_with_space_in_between
    skip
    nightwriter = NightWriter.new

    assert_equal "0...........0.0...", nightwriter.get_braille_string("a b")
  end

  def test_if_put_first_two_row_method_works
    skip

  end

  def test_letter_a
    nightwriter = NightWriter.new
    nightwriter.get_braille_string("ab")
    nightwriter.splitting_into_hash
    assert_equal 1, nightwriter.hash.count
  end

  def test_if_it_works_for_multiple_letters
    nightwriter = NightWriter.new
    nightwriter.get_braille_string("abc")
    nightwriter.splitting_into_hash
    assert_equal 1, nightwriter.hash.count
  end
  def test_if_top_middle_and_bottom_row_has_correct_brailles
    nightwriter = NightWriter.new
    nightwriter.get_braille_string("ab")
    nightwriter.splitting_into_hash
    nightwriter.into_rows
    assert_equal "0.0.", nightwriter.top_row
    assert_equal "..0.", nightwriter.middle_row
    assert_equal "....", nightwriter.bottom_row
  end

  def test_if_it_works_for_more_than_80_characters
    nightwriter = NightWriter.new
    input = "abaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    nightwriter.get_braille_string(input)
    nightwriter.splitting_into_hash
    assert_equal 2 , nightwriter.hash.count
    assert_equal 12, nightwriter.hash[2].length
    nightwriter.into_rows
    assert_equal 160, nightwriter.top_row.length
    assert_equal 160, nightwriter.middle_row.length
    assert_equal 160, nightwriter.bottom_row.length
  end

  def test_print1
    nightwriter = NightWriter.new
    input = "cbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    nightwriter.get_braille_string(input)
    nightwriter.splitting_into_hash
    nightwriter.into_rows
    nightwriter.print1
  puts  nightwriter.result
  end










end
