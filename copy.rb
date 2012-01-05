#!/usr/bin/ruby
require 'rubygems'
require 'ftools'

$FROM_PATH = '/Users/rosemaryl/Desktop/9/'
$TO_PATH = '/Users/rosemaryl/Desktop/9-half/'
$PATH = File.dirname(__FILE__)

src = File.open("#{$PATH}/copy.txt", 'r')
out = File.open("#{$PATH}/notfound.txt", 'w')

# The purpose of this script is for extracting the images used only in the overlap period between edition downloads

puts 'Processing:'
while(line = src.gets)
  if(line) 
     line = line.chomp 
  end
  if(File.exist?("#{$FROM_PATH}"+line))
    puts line
    if line.length > 0
      File.copy("#{$FROM_PATH}"+line, "#{$TO_PATH}")
    end
  else
    puts '----------------------- Could not find: ' + line
    out.puts line
  end
end
#line = "RI005699.jpg"
#File.copy("#{$FROM_PATH}"+line, "#{$TO_PATH}")
src.close