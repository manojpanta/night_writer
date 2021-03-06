require './lib/night_writer'
ARGV[0]
f = File.open('./lib/message.txt', 'r')
input = f.read
f.close

nw = NightWriter.new
nw.get_braille_string(input)
nw.splitting_into_brailles_in_hash
nw.into_rows
f = File.new('./lib/braille.txt', 'w')
puts "Created 'braille.txt' containing"\
" #{nw.braille_splitted_in_lines.join.delete("\n").length} characters"
f.puts(nw.braille_splitted_in_lines)
f.close

# ruby lib/night_write.rb  message.txt braille.txt
# we have all the alphabets and space, period, comma, exclamation, question mark
# single quotation, undescore, and capitalization in dictionary
