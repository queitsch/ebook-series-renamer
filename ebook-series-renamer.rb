#!/usr/bin/ruby

# Renames .mobi eBooks title metadata field from $title to $series_$title.
# Optionally renames .mobi files to $series_$filename.
#
# Takes the series title from the containing foldername.
# expects "ebook-meta" binary from calibre project in PATH.

require 'mobi'

path = ARGV[0]
series = path.split('/').last

Dir.chdir(path) unless File.file?(path) # todo any sort of error handling

Dir["**/*"].each {|book|
	title = (Mobi.metadata File.open(book)).title 
	cmd = "ebook-meta '" + path + book + "' --title '" + series + "_" + title + "'"
	system cmd
	# optional: change filename 
	# mv_cmd = "mv '" + path + book + "' '" + path + series + "_" + book + "'"
	# system mv_cmd
}
