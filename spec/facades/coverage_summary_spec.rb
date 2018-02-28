require 'rails_helper'

describe Posts::CoverageSummary do
  include ActionView::Helpers::NumberHelper

  let(:post)    { create(:post) }
  let(:targets) { create_list(:employee, 10) }
  let(:facade)  { described_class.new(post: post) }

  before do
    allow(post).to   receive(:targets).and_return(targets)
    allow(facade).to receive(:views).and_return(5)
  end

  it 'should calculate percentage' do
    expect(facade.percentage).to eq(number_to_percentage(50, precision: 2))
  end

  it 'should have targets' do
    expect(facade.has_targets?).to be_truthy
  end
end