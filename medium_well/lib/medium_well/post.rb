class MediumWell::Post
  attr_accessor :title, :author, :recommendations, :url

  @@all = []

  def initialize(title=nil, author=nil, recommendations=nil, url=nil)
    @title = title
    @author = author
    @recommendations = recommendations
    @url = url
    @@all << self
  end

  def self.new_post(post)
    self.new(
      post.css("h3").text,
      post.css(".postMetaInline-authorLockup > a").text,
      post.css(".js-actionRecommend .u-baseColor--buttonNormal").text,
      post.css(".postArticle-readMore a").attr("href")
    )
  end

  def self.all
    @@all
  end
end
