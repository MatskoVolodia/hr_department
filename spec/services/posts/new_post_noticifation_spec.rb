require 'rails_helper'

describe Posts::NewPostNotification do
  let(:operation) { described_class.call(post: post) }

  let(:post)    { create(:post) }
  let(:targets) { create_list(:employee, 5) }

  it 'should send notification emails' do
    allow(post).to receive(:targets).and_return(targets)

    PostsMailer.should_receive(:new_post_mail).exactly(5).times
               .and_return(double('PostsMailer', deliver: true))

    operation
  end
end