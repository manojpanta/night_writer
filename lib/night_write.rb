require './lib/night_writer'
ARGV[0]
f = File.open('./lib/message.txt', 'r')
input = f.read.delete("\n")
require 'pry'; binding.pry
f.close

f.close
nw = NightWriter.new
nw.get_braille_string(input)
nw.splitting_into_brailles_in_hash
nw.into_rows
f = File.new('./lib/braille.txt', 'w')
f.puts(nw.braille_splitted_in_lines)
f.close
