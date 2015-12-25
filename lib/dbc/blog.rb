require "dbc/blog/version"

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
  end

  class Post
    attr_reader :title, :body, :published_at, :drafted_at

    def initialize(attrs = {})
      attrs.each do |k, v|
        instance_variable_set("@#{k}", v)
      end

      @published_at = Time.now unless drafted?
    end

    def drafted?
      drafted_at
    end

    def published?
      published_at
    end
  end
end
