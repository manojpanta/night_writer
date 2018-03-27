require './lib/night_reader'
ARGV[0]
f = File.open('./lib/braille.txt', 'r')
input = f.read.split("\n")
f.close

nightreader = NightReader.new(input)
nightreader.put_every_three_string_into_hash
nightreader.create_braille_string
nightreader.create_output_string


f = File.new('./lib/original_message.txt', 'w')
f.puts(nightreader.output_string)
f.close

#ruby lib/night_write.rb  braille.txt  original_message.txt
