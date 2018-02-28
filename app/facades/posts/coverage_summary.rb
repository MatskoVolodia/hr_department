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
      number_to_percentage(views.to_f / post.targets.size.to_f * 100, precision: 2)
    end

    private

    attr_reader :post

    def find_impressions
      Impression.where(impressionable: post).size
    end

    def user_groups
      @user_groups ||= post.user_groups
    end
  end
end