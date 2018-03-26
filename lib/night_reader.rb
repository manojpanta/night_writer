require 'pry'
class NightReader
  attr_reader :dictionary,
              :brailles,
              :hash,
              :array
              :string, 
              :string1,
              :string2,
              :array,
              :array1,
              :array2




  def initialize
    @dictionary = {
                  "0....."=>"a",
                  "0.0..."=>"b",
                  "00...."=>"c",
                  "00.0.."=>"d",
                  "0..0.."=>"e",
                  "000..."=>"f",
                  "0000.."=>"g",
                  "0.00.."=>"h",
                  ".00..."=>"i",
                  ".000.."=>"j",
                  "0...0."=>"k",
                  "0.0.0."=>"l",
                  "00..0."=>"m",
                  "00.00."=>"n",
                  "0..00."=>"o",
                  "000.0."=>"p",
                  "00000."=>"q",
                  "0.000."=>"r",
                  ".00.0."=>"s",
                  ".0000."=>"t",
                  "0...00"=>"u",
                  "0.0.00"=>"v",
                  ".000.0"=>"w",
                  "00..00"=>"x",
                  "00.000"=>"y",
                  "0..000"=>"z",
                  "......"=>" ",
                  "..00.0"=>".",
                  "..0..."=>",",
                  "..000."=>"!",
                  "..0.00"=>"?",
                  "....0."=>"'",
                  "....00"=>"-",
                  ".....0"=>"cap"
                  }
                  @hash = {}
                  @brailles = brailles
                  @string = ""
                  @string1 = ""
                  @string2 = ""
                  @array = []
                  @array1 = []
                  @array2 = []

  end

  def braille_to_english(brailles)
    @brailles = brailles.delete("\n")
  end


  def brailles_in_hash
    until brailles.empty?
      @string << brailles[0..159]
      brailles.slice!(0..159)
      @string1 << brailles[0..159]
      brailles.slice!(0..159)
      @string2 << brailles[0..159]
      brailles.slice!(0..159)
    end
  end

  def line_one
    until @string.empty?








end
