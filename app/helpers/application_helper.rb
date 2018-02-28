module ApplicationHelper
  def humanize_attribute(attribute)
    attribute.to_s.humanize
  end

  def form_group(attribute, form, field_type)
    content = [
      form.label(attribute),
      form.send(field_type, attribute, class: 'form-control')
    ].join("\n")

    content_tag(:div, class: 'form-group') { content }
  end

  def flash_class(level)
    case level.to_sym
    when :notice  then 'alert alert-info'
    when :success then 'alert alert-success'
    when :error   then 'alert alert-error'
    when :alert   then 'alert alert-error'
    end
  end

  def active_class(link_path)
    'active' if current_page?(link_path)
  end
end
