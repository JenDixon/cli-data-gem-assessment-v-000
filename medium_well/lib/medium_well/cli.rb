class MediumWell::CLI
	def call
		puts "Today's Stories"
		list_stories
		menu
	end

	def list_stories
		@posts = MediumWell::Post.latest
		@posts.each.with_index(1) do |post, i|
			puts "#{i}. #{post.title} by #{post.author} with #{post.recommendations} recommendations"
		end
	end

	def menu
		puts "\nEnter the number of the post you'd like to read:"
		input = nil
		while input != "exit"
			list_stories
			input = gets.strip.downcase
			# case input
			# when "1"
			# 	puts "Story about 1"
			# when "2"
			# 	puts "Story about 2"
			# when "finished"
			# 	list_stories
			# when "exit"
			# 	puts "Goodbye"
			if input.to_i > 0
				the_post = @posts[input.to_i - 1]
				puts "#{the_post.title} by #{the_post.author} with #{the_post.recommendations} recommendations"
			else
				puts "This selection is not available. Enter a number or exit."
			end
		end
	end
end
