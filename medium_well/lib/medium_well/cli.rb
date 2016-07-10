class MediumWell::CLI
	def scraper
		MediumWell::Scraper.new
	end

	def call
		scraper.make_posts
		puts "Today's Stories"
		list_posts
		menu
	end

	def list_posts
		self.print_posts
	end

	def print_post(post)
		scraper.get_post_story(post)
	end

	def print_posts
		MediumWell::Post.all.each.with_index(1) do |post, i|
			puts "\n"
			puts "#{i}. #{post.title} by #{post.author} with #{post.recommendations} recommendations"
		end
	end

	def menu
		puts "\nEnter the number of the post you'd like to read:"
		input = nil
		while input != "exit"
			input = gets.strip.downcase
			if valid_number?(input)
				the_post = MediumWell::Post.all[input.to_i - 1]
				puts "#{the_post.title}\n"
				print_post(the_post)
				choose_again
			elsif valid_string?(input)
				puts "This is not a valid entry. Please enter a number or exit"
			else
				puts "Goodbye"
			end
		end
	end

	def valid_number?(new_input)
		new_input =~ /[0-9]+/ && new_input.to_i > 0
	end

	def valid_string?(new_input)
		new_input.is_a?(String) && new_input !="exit"
	end

	def choose_again
		puts "\nEnter a number for another post or exit"
	end
end
