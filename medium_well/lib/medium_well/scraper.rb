class MediumWell::Scraper

  def get_posts
    Nokogiri::HTML(open("https://medium.com/browse/ec92954bce3b"))
  end

  def scrape_posts
    self.get_posts.css("article.postArticle")
  end

  def make_posts
    scrape_posts.each do |post|
      MediumWell::Post.new_post(post)
    end
  end

  def get_post_story(post)
    story = Nokogiri::HTML(open(post.url))
    puts story.css(".section-inner p").text
  end
end
