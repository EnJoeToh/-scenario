#! ruby -EUTF-8

def to_tategaki(str, title)
	html_box = []
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
<body>
<article>
EOS

  tail = <<~EOS
</article>
</body>
</html>
EOS

  html_box << head
  line_count = 0
  scene_flag = 0

  str.lines do |line|
	  case line
	  when /★(.*?)\n/
	  	html_box << %Q|<h4>#{$1}</h4>|

	  when /(■.*?)\n/
		  html_box << %Q|<section>|
		  html_box << %Q|<div class="scene">#{$1}</div>|
		  scene_flag = 1

	  when /＠(.*?)\n/
		  if line_count > 0
			  html_box << %Q|</div>|
		  	line_count = 0
		  end
		  html_box << %Q|<div class="description">#{$1}</div>|

		when /＃(.*?)\n/
		  if line_count > 0
			  html_box << %Q|</div>|
		  	line_count = 0
		  end
		  html_box << %Q|<div class="comment">#{$1}</div>|

	  when /(.*?」)\n/
		  if line_count == 0
		  	html_box << %Q|<div class="lines">|
		   	html_box << %Q|<div class="line">#{$1}</div>|
		  	line_count += 1
		  else
			  html_box << %Q|<div class="line">#{$1}</div>|
			  line_count += 1
		  end

	  when "\n"
		  if line_count > 0
			  html_box << %Q|</div>|
			  line_count = 0
		  end
		  if scene_flag == 1
			  html_box << %Q|</section>|
			  scene_flag = 0
		  end
		  html_box << "\n"
	  else
		  html_box << line
		end
	end

  html_box << tail
  html_box
end
