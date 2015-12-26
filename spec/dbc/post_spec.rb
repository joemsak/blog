require 'spec_helper'

RSpec.describe Dbc::Post do
  it 'publishes drafted posts' do
    drafted = Dbc::Post.new(title: 'Drafted',
                            body: 'Drafted before its time',
                            drafted_at: Time.now)

    drafted.publish!

    expect(drafted.drafted_at).to be_nil
    expect(drafted.published_at).not_to be_nil
  end

  it 'drafts published posts' do
    published = Dbc::Post.new(title: 'Published', body: 'Published too soon')

    published.draft!

    expect(published.published_at).to be_nil
    expect(published.drafted_at).not_to be_nil
  end
end
