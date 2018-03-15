#! ruby -EUTF-8

require './to_tategaki'

puts to_tategaki(File.read(ARGV[0]), ARGV[0])