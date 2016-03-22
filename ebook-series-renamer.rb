#!/usr/bin/ruby

# Renames .mobi eBooks title metadata field from $title to $series_$title.
#
# Takes the series title from the parent foldername.
# expects "ebook-meta" binary from calibre project in PATH.

require 'mobi'

# extend String class with color output
class String
  def colorize(color_code)
    "\e[1;#{color_code}m#{self}\e[0m" #\e = ESCAPE; the "1;" sets bright mode
  end
  def gray;   colorize(30); end
  def grey;   colorize(30); end
  def red;    colorize(31); end
  def green;  colorize(32); end
  def yellow; colorize(33); end
  def blue;   colorize(34); end
  def pink;   colorize(35); end
  def cyan;   colorize(36); end
  def white;  colorize(37); end
end

basepath = ARGV[0]
counter = 0

Dir.chdir(basepath) 

Dir["**/*"].each {|bookpath|
	if File.file?(bookpath)
		series = bookpath.split('/')[-2]
		title = (Mobi.metadata File.open(bookpath)).title 
		puts "Writing title for ".yellow + basepath + bookpath + "...".yellow
		puts
		cmd = "ebook-meta '" + basepath + bookpath + "' --title '" + series + "_" + title + "'"
		system cmd
		puts
		counter += 1
	end
}

puts "Series information written to ".yellow + counter.to_s.yellow + " books.".yellow