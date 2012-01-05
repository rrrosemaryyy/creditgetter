#!/usr/bin/ruby
require 'rubygems'
require 'hpricot'
require 'fileutils'
require 'open-uri'

# wget -i sept-input.txt --output-document=sept-mid.txt
### You will get a bus error if you do too many skus. It works with 300 at a time, however.

# old Corbis format: http://www.corbisimages.com/Enlargement/Enlargement.aspx?id=
# new Corbis format: http://www.corbisimages.com/stock-photo/rights-managed/AALX001163/

$SUBDIR = 'sept'
$PATH = File.dirname(__FILE__)

f = File.new("#{$PATH}/#{$SUBDIR}/#{$SUBDIR}-output.txt", 'w' )

doc = Hpricot(open("#{$PATH}/#{$SUBDIR}/#{$SUBDIR}-mid.txt"))
doc.search("div[@id='image-details']").each do |info|
  # standard pairs
  #f.puts info.search("span[@id='ctl00_mainContent_imageID']").inner_html + " " + info.search("span[@id='ctl00_mainContent_creditLine']").inner_html
  
  # for the xml format: src=".jpg" sku="" copyright=""/>
   f.puts "src=\"" + info.search("td[@id='Data-CorbisId-Visible']").inner_html + ".jpg\" sku=\"" + info.search("td[@id='Data-CorbisId-Visible']").inner_html + "\" copyright=\"" + info.search("td[@id='Data-Credit']").inner_html + "\"/>"
end

f.close