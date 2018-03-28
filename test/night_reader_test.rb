require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_reader'

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

  def test_




  def test_brailles_in_hash
    skip
    nightreader = NightReader.new
    input = []
    nightreader.braille_to_english(input)
    nightreader.test
    nightreader.put_into_hash
    p nightreader.sentence
  end

end
