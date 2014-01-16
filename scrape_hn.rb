require 'pry' 				# You know what this does
require 'nokogiri' 		# This is for parsing and scraping web pages
require 'open-uri' 		# This lets us load web pages

doc = Nokogiri::HTML(open('https://news.ycombinator.com'))

titles = doc.css('td.title a').map do |x|
	x.content
end

# front_page = [{title: "Something", number_of_comments: 3}]
# All titles
# Number of comments (integer)
# Number of points (integer)
# Link to article
# Link to discussion
# Username of submitter
# Link to submitter profile

# Put all of these in an array of hashes

# BONUS
# Write these to a CSV file

binding.pry
