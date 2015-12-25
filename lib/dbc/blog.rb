require 'ostruct'
require "dbc/blog/version"

module Dbc
  class Blog
    def initialize
      @posts = []
    end

    def add_post(post_attrs = {})
      attrs = { published_at: Time.now }.merge(post_attrs)
      post = Post.new(attrs)
      @posts << post
      post
    end

    def posts
      @posts.sort_by(&:published_at).reverse
    end
  end

  class Post < OpenStruct; end
end
