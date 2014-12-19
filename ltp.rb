#
# ltp.rb
# 
# Convert a TeX file into plaintext so that it can be fed into popular
# style, spelling, grammar, etc. checkers. 
#

require 'optparse'

class LTPOptionParser
	options = {}

	def self.parse(args)
		OptionParser.new do |opts|
			opts.banner = "Usage: ltp.rb [options]"

			opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
				options[:verbose] = v
			end

			opts.on("-f", "Path to TeX (.tex) file") do |v|
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

options = LTPOptionParser.parse(ARGV)
puts options[:verbose]

# handle = File.open(options["filename"], "r")
