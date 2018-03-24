require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'


class NightWriterTest < Minitest::Test

  def test_if_it_exists
    nightwriter = NightWriter.new

    assert_instance_of NightWriter, nightwriter
  end

  def test_it_can_translate_one_letter
    skip
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
    nightwriter = NightWriter.new
    nightwriter.get_braille_string("a")
    assert_equal "0.....", nightwriter.braille
    nightwriter.into_top_row
    assert_equal ["0."], nightwriter.top_row
    nightwriter.into_middle_row
    assert_equal [".."], nightwriter.middle_row
    nightwriter.into_bottom_row
    assert_equal [".."], nightwriter.bottom_row
    # assert_equal ["0."], nightwriter.into_middle_row("a b")

  end









end
