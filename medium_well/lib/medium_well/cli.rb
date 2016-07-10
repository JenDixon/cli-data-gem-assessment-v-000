class MediumWell::CLI
	def call
		MediumWell::Scraper.new.make_posts
		puts "Today's Stories"
		list_stories
		menu
	end

	def list_posts
		self.print_posts
	end

	def print_post(post)
		puts "\n"
		puts "#{i}. #{post.title} by #{post.author} with #{post.recommendations} recommendations"
		puts "\n"
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
				puts "#{the_post.title} by #{the_post.author} with #{the_post.recommendations} recommendations"
			elsif input = "list posts"
				list_posts
			else
				puts "This selection is not available. Enter a number, list post or exit."
			end
		end
	end
end
