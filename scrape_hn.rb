require 'pry'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('https://news.ycombinator.com/'))

# Get all the titles
titles = doc.css('td.title a').map do |title|
	title.content
end
titles = titles[0...-1]

# Get Number of comments (integer)
user_and_comments = doc.css('.subtext a').map do |x|
	x
end

users = []
comments = []
comment_links = []
user_profile_links = []
user_and_comments.each_with_index do |x, index|
	if index % 2 == 0
		# Get users
		users << x.content
		# Link to submitter profile
		user_profile_links << x.attributes["href"].value
	else
		# Get comments as integers
		comments << x.content.scan(/\d+/)[0].to_i
		# Get link to discussion
		comment_links << x.attributes["href"].value
	end
end

# Number of points (integer)
points = []
doc.css('.subtext span').each_entry do |x|
	points << x.content[0..1].to_i
end

# Link to article
article_links = doc.css('td.title a').map do |x|
	x.attributes["href"].value
end

# Put all of these in an array of hashes!
api = []
i = 0
while i < titles.length
	api[i] = {}
	api[i][:title] = titles[i]
	api[i][:article_link] = article_links[i]
	api[i][:user] = users[i]
	api[i][:user_profile_link] = user_profile_links[i]
	api[i][:comments] = comments[i]
	api[i][:comment_links] = comment_links[i]
	api[i][:points] = points[i]
	i += 1
end

File.open('output.json', 'w') do |file|
	file.puts api
end
