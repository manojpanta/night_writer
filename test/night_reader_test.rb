require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_reader'
require 'pry'

class NightReaderTest < Minitest::Test

  def test_if_it_exists
    nightreader = NightReader.new([])
    assert_instance_of NightReader, nightreader
  end

  def test_dictionary_is_accessible
    nightreader = NightReader.new([])
    assert_equal "a", nightreader.dictionary["0....."]
  end

  def test_if_brailles_in_hash_is_empty_initially
    nightreader = NightReader.new([])
    assert_equal 0, nightreader.brailles_in_hash.count
  end

  def test_brailles_into_array_method_can_get_the_arguements_passed_in
    nightreader = NightReader.new([".0....", "..0..."])
    result = [".0....", "..0..."]
    assert_equal result, nightreader.brailles_array
  end

  def test_braille_string_is_empty_intially
    nightreader = NightReader.new([".0....", "..0..."])
    assert nightreader.braille_string.empty?
  end

  def test_output_string_is_empty_intially
    nightreader = NightReader.new([".0....", "..0..."])
    assert nightreader.output_string.empty?
  end

  def test_if_input_appears_in_a_hash_after_called
    nightreader = NightReader.new([".0....", "..0...", ".0...."])
    nightreader.put_every_three_string_into_hash
    result = {1=>[".0....", "..0...", ".0...."]}
    assert_equal result, nightreader.brailles_in_hash
    assert_equal 1 , nightreader.brailles_in_hash.count
  end
  def test_if_the_length_of_hash_increases_as_the_input_is_increased
    input = [".0....", "..0...", ".0....", "......", "0.....", "0....."]
    nightreader = NightReader.new(input)
    nightreader.put_every_three_string_into_hash
    result = {1=>[".0....", "..0...", ".0...."],
              2=>["......", "0.....", "0....."]}
    assert_equal result, nightreader.brailles_in_hash
    assert_equal 2 , nightreader.brailles_in_hash.count
  end

  def test_create_braille_string
    input = [".0....", "..0...", ".0....", "......", "0.....", "0....."]
    nightreader = NightReader.new(input)
    nightreader.put_every_three_string_into_hash
    nightreader.create_braille_string
    assert_equal ".0...0..0...........0.0.............", nightreader.braille_string
  end

  def test_create_output_string
    input = ["0.0.", "....", "...."]
    nightreader = NightReader.new(input)
    nightreader.put_every_three_string_into_hash
    nightreader.create_braille_string
    nightreader.create_output_string
    assert_equal "aa", nightreader.output_string
  end




end
