class MediumWell::Post
  attr_accessor :title, :author, :recommendations, :url

  def self.latest
    #I should be able to return several instances of posts
#     puts <<-DOC
# 1. Stuff that matters by Tim O'Reilly - 36 recommendations
# 2. How to Build a Neuron by Eric Elliott - 16 recommendations
#     DOC

    post_1 = self.new
    post_1.title = "Stuff that matters"
    post_1.author = "Tim O'Reilly"
    post_1.recommendations = "36"
    post_1.url = "https://medium.com/@HuffingtonPost/guess-how-many-black-people-have-been-killed-by-police-this-year-9d2cae33b314#.c7esb921c"

    post_2 = self.new
    post_2.title = "How to Build a Neuron"
    post_2.author = "Eric Elliott"
    post_2.recommendations = "16"
    post_2.url = "https://medium.com/@_ericelliott/youre-looking-at-a-tiny-slice-of-the-market-a8724a0dc350#.fg7dmhyi9"

    [post_1, post_2]
  end
end
