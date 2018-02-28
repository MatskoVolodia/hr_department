module Posts
  class CoverageSummary
    include ActionView::Helpers::NumberHelper

    delegate :targets, to: :post

    def initialize(params = {})
      @post = params[:post]
    end

    def views
      @views ||= find_impressions
    end

    def percentage
      @percentage ||= number_to_percentage(percent_viewed, precision: 2)
    end

    def has_targets?
      post.targets.size.positive?
    end

    private

    attr_reader :post

    def percent_viewed
      views.to_f / post.targets.size.to_f * 100
    end

    def find_impressions
      Impression.where(impressionable: post).size
    end

    def user_groups
      @user_groups ||= post.user_groups
    end
  end
end
