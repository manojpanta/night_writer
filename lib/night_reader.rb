class NightReader
  attr_reader :dictionary,
              :brailles,
              :hash,
              :sentence,
              :sentence1





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
    @brailles = []
    @sentence = ''
    @sentence1 = ''
  end

  def braille_to_english(brailles_array)
    brailles_array.each do |string|
      @brailles << string
    end
  end

  def test
    count = 1
    until @brailles.empty?
      @hash[count] = @brailles.shift(3)
      count += 1
    end
  end

  def put_into_hash(count = 1)
    return @sentence if count > @hash.count
    until @hash[count][2].empty?
      @sentence << @hash[count][0][0..1] << @hash[count][1][0..1] << @hash[count][2][0..1]
      @hash[count][0].slice!(0..1)
      @hash[count][1].slice!(0..1)
      @hash[count][2].slice!(0..1)
    end
    count += 1
    put_into_hash(count)
  end

  def translate
    until @sentence.empty?
      if @sentence[0..5] == ".....0"
        @sentence.slice!(0..5)
        @sentence1 << dictionary[@sentence[0..5]].upcase
        @sentence.slice!(0..5)
      else
        @sentence1 << dictionary[@sentence[0..5]]
        @sentence.slice!(0..5)
      end
    end
  end
end
