require 'pry'
class NightWriter


  attr_reader :dictionary, :top_row, :middle_row, :bottom_row, :braille, :hash

  def initialize
    @dictionary = {
                  "a" => "0.....",
                  "b" => "0.0...",
                  "c" => "00....",
                  "d" => "00.0..",
                  "e" => "0..0..",
                  "f" => "000...",
                  "g" => "0000..",
                  "h" => "0.00..",
                  "i" => ".00...",
                  "j" => ".000..",
                  "k" => "0...0.",
                  "l" => "0.0.0.",
                  "m" => "00..0.",
                  "n" => "00.00.",
                  "o" => "0..00.",
                  "p" => "000.0.",
                  "q" => "00000.",
                  "r" => "0.000.",
                  "s" => ".00.0.",
                  "t" => ".0000.",
                  "u" => "0...00",
                  "v" => "0.0.00",
                  "w" => ".000.0",
                  "x" => "00..00",
                  "y" => "00.000",
                  "z" => "0..000",
                  " " => "......",
                  "." => "..00.0",
                  "," => "..0...",
                  "!" => "..000.",
                  "?" => "..0.00",
                  "'" => "....0.",
                  "-" => "....00",
                  "cap" => ".....0"
                }
    @top_row = ''
    @middle_row = ''
    @bottom_row = ''
    @braille = ""
    @hash = {}
  end

  def get_braille_string(letter)
    letter = letter.chars
    letter.map do |letter|
      @braille << dictionary[letter]
    end
    @braille
  end

  def splitting_into_hash
    count = 1
    until braille.empty?
      hash[count] = braille[0..479]
      braille.slice!(0..479)
      count += 1
    end
  end

  def into_rows
    until @hash[1].empty?
      # require 'pry'; binding.pry
      @top_row << @hash[1][0..1]
      @hash[1].slice!(0..1)
      @middle_row << @hash[1][0..1]
      @hash[1].slice!(0..1)
      @bottom_row << @hash[1][0..1]
      @hash[1].slice!(0..1)
    end
  end

  def letter_a
   p  top_row.join
   p middle_row.join
   p bottom_row.join
  end

  def hashes_into_rows
    # until @hash[1].empty?
      into_rows
    # end
  end

















end
