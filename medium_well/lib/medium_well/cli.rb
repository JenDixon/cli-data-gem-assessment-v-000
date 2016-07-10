class MediumWell::CLI
	def scraper
		MediumWell::Scraper.new
	end

	def call
		scraper.make_posts
		menu
	end

	def menu
		puts "Today's Stories"
		puts "Sort by recency or by recommendations. Enter 1 for recency or 2 for recommendations."
		list_input = gets.strip
		new_posts = list_posts(list_input)
		print_posts(new_posts)
		puts "\nEnter the number of the post you'd like to read:"
		input = nil
		while input != "exit"
			input = gets.strip.downcase
			if valid_number?(input)
				the_post = new_posts[input.to_i - 1]
				puts "#{the_post.title}\n"
				print_post(the_post)
				choose_again
			elsif input == "print posts"
				puts "Sort by recency or by recommendations. Enter 1 for recency or 2 for recommendations."
				list_input = gets.strip
				new_posts = list_posts(list_input)
				print_posts(new_posts)
			elsif valid_string?(input)
				puts "This is not a valid entry. Please enter a number or exit"
			else
				puts "Goodbye"
			end
		end
	end

	def list_posts(linput)
		if linput == "1"
			posts
		elsif linput == "2"
			sorted_posts
		end
	end

	def print_post(post)
		scraper.get_post_story(post)
	end

	def posts
		MediumWell::Post.all
	end

	def sorted_posts
		MediumWell::Post.all.sort { |a,b| a.recommendations.to_i <=> b.recommendations.to_i }
	end

	def print_posts(post_input)
		post_input.each.with_index(1) do |post, i|
			puts "\n"
			puts "#{i}. #{post.title} by #{post.author} with #{post.recommendations ? post.recommendations : "0"} recommendations"
		end
	end

	def valid_number?(new_input)
		new_input =~ /[0-9]+/ && new_input.to_i > 0
	end

	def valid_string?(new_input)
		new_input.is_a?(String) && new_input !="exit"
	end

	def choose_again
		puts "\nEnter a number for another post, print posts to list the posts or exit to end this session."
	end
end
