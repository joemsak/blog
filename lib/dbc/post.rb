module Dbc
  class Post
    attr_reader :title, :body, :published_at, :drafted_at

    def initialize(attrs = {})
      attrs.each do |k, v|
        instance_variable_set("@#{k}", v)
      end

      publish! unless drafted?
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
