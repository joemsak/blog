require 'spec_helper'

describe Dbc::Blog do
  it 'lists posts with newest at top' do
    blog = Dbc::Blog.new
    first_post = blog.add_post(title: 'First post', body: 'A great, long post')
    second_post = blog.add_post(title: 'Second post', body: 'Another great, long post')

    expect(blog.posts).to eq([second_post, first_post])
  end
end
