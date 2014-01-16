# Scraping Hacker News with Nokogiri

Scraping is sometimes needed for sites that don't have an API. It shouldn't be the first tool you grab for in the toolbox of Ruby and programming, but occasionally required. Every site is different and it can be a real pain to deal with irregular data and poorly formed HTML. 

## Exercise

Use [Nokogiri](https://github.com/sparklemotion/nokogiri) to scrape Hacker News. Some example code is provided for you that will get you started. 

Your goal is to make an **array** of **hashes** from the data, where each story on the front page of HN represents a hash in the array. You should make sure each hash has the following: 

* Titles of each submission
* Number of comments (integer)
* Number of points (integer)
* Link to article
* Link to discussion
* Username of submitter
* Link to submitter profile

```ruby
# A truncated example hash
front_page_stories = [{title: "Something", number_of_comments: 3}, {title: "Something else", number_of_comments: 5}]
```

### Bonus 1 - Submission class

Create a Submission class that can represent each submission on the front page of HN. Instead of a hash, it should have attributes for each of the above items that you scrape.

Then instead of an array of hashes, create an array of Submissions.

### Bonus 2 - Save to file

When you run this program, save a valid CSV or JSON file that represents each Submission so that it could be accessed later.

### Bonus 3 - Ensure file contents are unique

Don't save Submissions to the file that are already present in the file. So if you run it twice within a few minutes, it shouldn't create duplicates

### Bonus 4 - Update existing file contents

The number of points and comments will/may change over time. Make sure that any Submissions in the file are updated properly when the script is run, but don't get rid of ones that are no longer on the front page. 

### Bonus 5 - Scrape Comments

Take this to the next level. Now scrape each page of comments, create a Comment class, and store each comment as an item in an Array of Comments on the Submission. 

Don't worry about nesting of the comments.
