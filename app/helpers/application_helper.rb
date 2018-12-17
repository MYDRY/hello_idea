# frozen_string_literal: true

module ApplicationHelper
  def format_datetime(datetime, type = :datetime)
    return '' unless datetime

    format = case type
             when :datetime
               '%Y/%m/%d %H:%M:%S'
             when :date
               '%Y/%m/%d'
             else
               '%H:%M:%S'
             end

    datetime.strftime(format)
  end

  def inform_validation_errror(obj)
    html_text = ''
    obj.errors.full_messages.each do |message|
      html_text += content_tag(:div, class: 'alert alert-danger') do
        content_tag(:a, 'x', data: { dismiss: 'alert' })
        message
      end
    end
    raw(html_text)
  end
end
