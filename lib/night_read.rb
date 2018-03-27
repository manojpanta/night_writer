require './lib/night_reader'
ARGV[0]
f = File.open('./lib/braille.txt', 'r')
input = f.read.split("\n")

f.close
nightreader = NightReader.new
nightreader.braille_to_english(input)
nightreader.test
nightreader.put_into_hash
nightreader.translate


f = File.new('./lib/original_message.txt', 'w')
f.puts (nightreader.sentence1)
f.close
