require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_reader'

class NightReaderTest < Minitest::Test
def test_if_it_exists
  nightreader = NightReader.new
  assert_instance_of NightReader, nightreader
end






end
