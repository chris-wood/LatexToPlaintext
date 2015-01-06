#
# ltp.rb
# 
# Convert a TeX file into plaintext so that it can be fed into popular
# style, spelling, grammar, etc. checkers. 
#

require 'optparse'

class LTPOptionParser
	def self.parse(args)
		options = {}
		OptionParser.new do |opts|
			opts.banner = "Usage: ltp.rb [options]"

			opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
				options[:verbose] = v
			end

			opts.on("-fFILENAME", "Path to TeX (.tex) file") do |v|
				options[:filename] = v
			end

			# TODO: add other options as needed

			opts.on_tail("--version", "Show version") do
				puts "0.1"
				exit
			end

		end.parse!
		return options
	end
end

# RE
# \\\S+{\S+}
# \\\S+
# %(\S|\s)*  
def tex_to_txt(fname)
	plaintext = ""
	File.open(fname, "r").each_line do |line|
		newline = line.gsub(/\\\S+{(\s|\S)+}/,'').gsub(/\\\S+/, '').gsub(/%(\S|\s)*/,'').strip()
		plaintext = plaintext + newline
	end
	puts plaintext
end

options = LTPOptionParser.parse(ARGV)
tex_to_txt(options[:filename])

# usage: ruby ltp.rb -f ~/Dropbox/PhD/Papers/AC3N15/ac3n14.tex
