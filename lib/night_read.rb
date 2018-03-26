require './lib/night_reader'
ARGV[0]
f = File.open('./lib/braille.txt', 'r')
input = f.read.delete("\n")

f.close

f.close
nr = NightReader.new

f = File.new('./lib/original_message.txt', 'w')
f.puts(nr.braille_to_english(input))
f.close
