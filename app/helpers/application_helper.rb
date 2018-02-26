module ApplicationHelper
  def humanize_attribute(attribute)
    attribute.to_s.humanize
  end

  def form_group(attribute, form, field_type)
    content_tag(:div, class: 'form-group') do
      form.label(attribute) +
          form.send(field_type, attribute, class: 'form-control')
    end
  end

  def flash_class(level)
    case level.to_sym
      when :notice  then 'alert alert-info'
      when :success then 'alert alert-success'
      when :error   then 'alert alert-error'
      when :alert   then 'alert alert-error'
    end
  end
end
