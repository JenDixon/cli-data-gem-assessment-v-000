class MediumWell::CLI
	def call
		puts "Today's Stories"
		list_stories
		menu
	end

	def list_stories
		puts <<-DOC
1. Stuff that matters by Tim O'Reilly in Code for America Blog
2. How to Build a Neuron by Eric Elliott in JavaScript Scene
		DOC
	end

	def menu
		puts "\nEnter the number of the post you'd like to read:"
		input = nil
		while input != "exit"
			list_stories
			input = gets.strip.downcase
			case input
			when "1"
				puts "Story about 1"
			when "2"
				puts "Story about 2"
			when "finished"
				list_stories
			when "exit"
				puts "Goodbye"
			end
		end
	end
end
