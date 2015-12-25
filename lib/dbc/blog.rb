require "dbc/version"
require 'dbc/post'

module Dbc
  class Blog
    def initialize
      @posts = []
    end

    def add_post(post_attrs = {})
      post = Post.new(post_attrs)
      @posts << post
      post
    end

    def posts
      @posts.select(&:published?).sort_by(&:published_at).reverse
    end

    def drafted_posts
      @posts.select(&:drafted?).sort_by(&:drafted_at).reverse
    end
  end
end
