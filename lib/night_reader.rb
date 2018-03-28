class NightReader
  attr_reader :dictionary,
              :brailles_in_hash,
              :braille_string,
              :output_string,
              :brailles_array
  def initialize(input)
    @dictionary = {  '0.....' => 'a',
                     '0.0...' => 'b',
                     '00....' => 'c',
                     '00.0..' => 'd',
                     '0..0..' => 'e',
                     '000...' => 'f',
                     '0000..' => 'g',
                     '0.00..' => 'h',
                     '.00...' => 'i',
                     '.000..' => 'j',
                     '0...0.' => 'k',
                     '0.0.0.' => 'l',
                     '00..0.' => 'm',
                     '00.00.' => 'n',
                     '0..00.' => 'o',
                     '000.0.' => 'p',
                     '00000.' => 'q',
                     '0.000.' => 'r',
                     '.00.0.' => 's',
                     '.0000.' => 't',
                     '0...00' => 'u',
                     '0.0.00' => 'v',
                     '.000.0' => 'w',
                     '00..00' => 'x',
                     '00.000' => 'y',
                     '0..000' => 'z',
                     '......' => ' ',
                     '..00.0' => '.',
                     '..0...' => ',',
                     '..000.' => '!',
                     '..0.00' => '?',
                     '....0.' => "'",
                     '....00' => '-',
                     '.....0' => 'cap',
                     '------' => "\n" }
    @brailles_in_hash = {}
    @brailles_array  = input
    @braille_string  = ''
    @output_string   = ''
  end

  def put_every_three_string_into_hash
    count = 1
    until @brailles_array.empty?
      @brailles_in_hash[count] = @brailles_array.shift(3)
      count += 1
    end
  end

  def create_braille_string
    @brailles_in_hash.each_value do |array|
      until array[2].empty?
        @braille_string << array[0][0..1] << array[1][0..1] << array[2][0..1]
        slice_those_two(array)
      end
    end
  end

  def slice_those_two(array)
    array[0].slice!(0..1)
    array[1].slice!(0..1)
    array[2].slice!(0..1)
  end

  def create_output_string
    until @braille_string.empty?
      if @braille_string[0..5] == '.....0'
        @braille_string.slice!(0..5)
        @output_string << dictionary[@braille_string[0..5]].upcase
        @braille_string.slice!(0..5)
      else
        @output_string << dictionary[@braille_string[0..5]]
        @braille_string.slice!(0..5)
      end
    end
  end
end
