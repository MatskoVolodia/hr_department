module ApplicationHelper
  def humanize_attribute(attribute)
    attribute.to_s.humanize
  end
end
