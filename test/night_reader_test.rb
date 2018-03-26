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

  def test_splitting_into_hashes
    nightreader = NightReader.new
    nightreader.braille_to_english("..0.0.0..00.0.0....0.0..0....000.0.00.00..0.00..0.0..0.00.00..000..0.0...00.0..0..000.00..0.0...0.0.0.00...0.0.00....00.0...00.000000.0..0..0.00..000.0.000.0...
    ..0.00..0.0.0..0..0.0.......0..00.00.0.....00...00..0.0..0.0...0.0000...0000..00.......0..0..0..00.0...0..000.0000..0000.0..0.0..000.0000...0..0..0..0.00.0..0..
    .0..0.....0.0.......0.......0.000.0...0...0.....0.....0.........0.0.0...0.....0.......0.........0..........0..0.....0...........0.....0.0.....00..0...0.0.0.....")
    assert_equal "abcd", nightreader.translate


end
