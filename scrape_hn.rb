require 'pry' 			  # You know what this does
require 'nokogiri' 		# This is for parsing and scraping web pages
require 'open-uri' 		# This lets us load web pages

doc = Nokogiri::HTML(open('https://news.ycombinator.com'))

titles = doc.css('td.title a').map do |x|
  x.content
end

binding.pry
