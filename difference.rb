#! ruby -EUTF-8
require 'open3'
require './to_tategaki'

old_file = File.read(ARGV[0])
new_file = File.read(ARGV[1])



doc, e, s = Open3.capture3("docdiff #{ARGV[0]} #{ARGV[1]}")

b = doc.gsub("\n", "").gsub("<br />", "\n")
c = b.gsub(/<\?xml.*?<body>/, "").gsub("</body></html>", "")

title = "diff between #{ARGV[0]} and #{ARGV[1]}"

puts to_tategaki(c, title)