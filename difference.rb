#! ruby -EUTF-8
require 'open3'
require './to_tategaki'

old_file = File.read(ARGV[0])
new_file = File.read(ARGV[1])

title = "diff between #{ARGV[0]} and #{ARGV[1]}"

head = <<~EOS
<!DOCTYPE html>
<html lang=\"ja\">
<head>
	<meta charset=\"UTF-8\">
	<title>#{title}</title>
	<style>
      body {
/*      margin: 1rem;*/
        margin-left: 2em;
        font-family: serif;
      }

      article {
        width: 60em;
        max-width: 60em;
        height: 20rem;
        margin-bottom: 2rem;
        margin-top: 2rem;
        writing-mode: vertical-rl;
        columns: 20rem;
/*        column-gap: 400px;*/

        column-gap: 40px;
      }

      h4{
      	margin-top: 1em;
      }

      section{
        margin-right: 1em;
      }

      div.scene{
        margin-right: 1em;
      }

      div.description{
        margin-top: 1em;
        text-indent: 1em;

      }
      div.line {
        margin-top: 1em;
        text-indent: -1em;
      }
      div.comment {
      	margin-top: 2em;
      	color: red;
      }

      span.del {
      	background: lightsalmon;
      	border: thin inset;

      } span.add {
      	background: lightskyblue;
      	font-weight: bolder;
      	border: thin outset;
      }

      span.before-change {
      	background: wheat;
      	border: thin inset;
      }

      span.after-change {
      	background: lightgreen;
      	font-weight: bolder;
      	border: thin outset;
      }
  </style>
</head>
<body><article>
EOS


doc, e, s = Open3.capture3("docdiff #{ARGV[0]} #{ARGV[1]}")

b = doc.gsub("\n", "").gsub("<br />", "<br>")
c = b.gsub(/<\?xml.*?<body>/, head).gsub("</body></html>", "") + "</article></body></html>"


puts c