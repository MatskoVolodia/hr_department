module Posts
  class CoverageSummary
    include ActionView::Helpers::NumberHelper

    def initialize(params = {})
      @post = params[:post]
    end

    def targets
      @targets ||= find_targets
    end

    def views
      @views ||= find_impressions
    end

    def percentage
      number_to_percentage(views.to_f / targets.to_f * 100, precision: 2)
    end

    private

    attr_reader :post

    def find_targets
      return User.count if user_groups.size.zero?

      post.user_groups.select(&:user_ids).flatten.uniq.size
    end

    def find_impressions
      Impression.where(impressionable: post).size
    end

    def user_groups
      @user_groups ||= post.user_groups
    end
  end
end