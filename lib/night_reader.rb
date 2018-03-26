require 'pry'
class NightReader
  attr_reader :dictionary,
              :brailles,
              :hash,
              :array




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
    @array = []

  end

  def braille_to_english(brailles)
    @brailles = brailles.delete("\n")
  end


  def brailles_in_hash
    count = 1
    until brailles.empty?
      hash[1] = brailles[0..479]
      brailles.slice!(0..479)
      count += 1
    end
  end

  def break_into_arrays
    @array << hash[1]







end
