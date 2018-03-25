require 'pry'

class NightWriter
  attr_reader :dictionary,
              :braille_splitted_in_lines,
              :brailles_in_hash,
              :brailles
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
    @brailles = ''
    @brailles_in_hash = {}
    @braille_splitted_in_lines = []
    @letters = ('a'..'z').to_a
  end

  def get_braille_string(letter)
    letter = letter.chars
    letter.map do |letter|
      if letter.upcase == letter && @letters.include?(letter.downcase)
        @brailles << dictionary['cap']
        @brailles << dictionary[letter.downcase]
      else
        @brailles << dictionary[letter]
      end
    end
    @brailles
  end

  def splitting_into_brailles_in_hash
    count = 1
    until brailles.empty?
      brailles_in_hash[count] = brailles[0..479]
      brailles.slice!(0..479)
      count += 1
    end
  end

  def into_rows(count = 1)
    top_row = ''
    middle_row = ''
    bottom_row = ''
    return  @braille_splitted_in_lines if count > @brailles_in_hash.length
    until @brailles_in_hash[count].empty?
      top_row << @brailles_in_hash[count][0..1]
      @brailles_in_hash[count].slice!(0..1)
      middle_row << @brailles_in_hash[count][0..1]
      @brailles_in_hash[count].slice!(0..1)
      bottom_row << @brailles_in_hash[count][0..1]
      @brailles_in_hash[count].slice!(0..1)
    end
    rows = top_row + "\n" + middle_row + "\n" + bottom_row + "\n"
    @braille_splitted_in_lines << rows
    count += 1
    into_rows(count)
  end
end



ARGV[0]
f = File.open('./lib/message.txt', 'r')
input = f.read.delete("\n")
binding.pry


f.close

nw = NightWriter.new
nw.get_braille_string(input)
nw.splitting_into_brailles_in_hash
nw.into_rows
f = File.new('./lib/braille.txt', 'w')
f.puts(nw.braille_splitted_in_lines)
f.close
