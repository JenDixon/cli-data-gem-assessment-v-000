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
			if input =~ /[0-9]+/ && input.to_i > 0
				the_post = MediumWell::Post.all[input.to_i - 1]
				puts "#{the_post.title}\n"
				print_post(the_post)

				choose_again
			elsif input.is_a?(String) && input !="exit"
				puts "This is not a valid entry. Please enter a number or exit"
			else
				puts "Goodbye"
			end
		end
	end

	def choose_again
		puts "\nEnter a number for another post or exit"
	end
end
