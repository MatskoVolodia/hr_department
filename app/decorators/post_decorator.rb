class PostDecorator < ApplicationDecorator
  include ActionView::Helpers::DateHelper

  def created_ago
    "#{time_ago_in_words(created_at)} ago"
  end
end
