require 'spec_helper'

describe Dbc::Blog do
  let(:blog) { Dbc::Blog.new }

  it 'lists posts with newest at top' do
    first_post = blog.add_post(title: 'First post', body: 'A great, long post')
    second_post = blog.add_post(title: 'Second post', body: 'Another great, long post')

    expect(blog.posts).to eq([second_post, first_post])
  end

  it 'lists only published posts by default' do
    published = blog.add_post(title: 'First post', body: 'A great, long post')
    drafted = blog.add_post(title: 'Second post',
                            body: 'Another great, long post',
                            drafted_at: Time.now)

    expect(blog.posts).to eq([published])
  end

  it 'lists drafted posts, newest on top' do
    newer_drafted = blog.add_post(drafted_at: Time.now - 1)
    older_drafted = blog.add_post(drafted_at: Time.now - 2)

    expect(blog.drafted_posts).to eq([newer_drafted, older_drafted])
  end
end
