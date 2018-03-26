require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_reader'

class NightReaderTest < Minitest::Test
  def test_if_it_exists
  nightreader = NightReader.new
  assert_instance_of NightReader, nightreader
  end

  def test_brailles_in_hash
    nightreader = NightReader.new
    nightreader.braille_to_english("0.....")
    nightreader.brailles_in_hash
    p nightreader.hash
    assert_equal 1 , nightreader.hash.count

  end
end
