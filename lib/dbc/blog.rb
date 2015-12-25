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

    def drafted_posts
      @posts.select(&:drafted?).sort_by(&:drafted_at).reverse
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

    def draft!
      @drafted_at = Time.now
      @published_at = nil
    end

    def published?
      published_at
    end

    def publish!
      @published_at = Time.now
      @drafted_at = nil
    end
  end
end
