require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_reader'

class NightReaderTest < Minitest::Test

  def test_if_it_exists
    nightreader = NightReader.new
    assert_instance_of NightReader, nightreader
  end

  def test_dictionary_is_accessible
    nightreader = NightReader.new

    assert_equal "a", nightreader.dictionary["0....."]
  end

  def test_



  def test_brailles_in_hash
    nightreader = NightReader.new
    input = ["maso", "noni", "jaya","soma", "nino", "yaja"]
    nightreader.braille_to_english(input)
    nightreader.test
    nightreader.put_into_hash
    p nightreader.sentence
  end

end
