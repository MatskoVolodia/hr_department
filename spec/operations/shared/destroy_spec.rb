require 'rails_helper'

describe Shared::Destroy do
  let(:post)      { create(:post) }
  let(:operation) { described_class.call(item: post) }

  it 'should call destroy on item' do
    expect(post).to receive(:destroy)

    operation
  end
end
