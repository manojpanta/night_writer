require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'


class NightWriterTest < Minitest::Test

  def test_if_it_exists
    nightwriter = NightWriter.new

    assert_instance_of NightWriter, nightwriter
  end

  def test_it_can_translate_one_word
    nightwriter = NightWriter.new
    assert_equal , nightwriter



  end





end
