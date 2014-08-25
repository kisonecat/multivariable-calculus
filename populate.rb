#! /usr/bin/ruby

c = File.open( "course.xim", "w" )

File.open('topics.txt').readlines.each{ |line|
  shortname = line.split( ": " )[0]
  title = line.split( ": " )[1].strip
  puts shortname, title

  template = File.open( 'template.tex' ).read
  template.gsub!( 'TITLE', title )

  Dir.mkdir( shortname ) unless File.exist?( shortname )

  filename = "#{shortname}/#{shortname}.tex"
  f = File.open( filename, "w" )
  f.puts filename
  f.close

  c.puts "#{shortname}/#{shortname}"

}

c.close
