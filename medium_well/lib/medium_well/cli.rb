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
			if input.to_i > 0
				the_post = MediumWell::Post.all[input.to_i - 1]
				puts "#{the_post.title}\n"
				print_post(the_post)
			elsif input == "list posts"
				list_posts
			else
				puts "This selection is not available. Enter a number, list post or exit."
			end
		end
	end
end
