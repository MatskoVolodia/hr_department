module Posts
  class CoverageSummary
    include ActionView::Helpers::NumberHelper

    delegate :targets, :user_groups, to: :post

    def initialize(params = {})
      @post = params[:post]
    end

    def views
      @views ||= Impression.where(impressionable: post).size
    end

    def percentage
      @percentage ||= number_to_percentage(percent_viewed, precision: 2)
    end

    def has_targets?
      targets.size.positive?
    end

    private

    attr_reader :post

    def percent_viewed
      views.to_f / targets.size * 100
    end
  end
end
