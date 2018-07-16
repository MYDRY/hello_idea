# coding: utf-8
module ApplicationHelper
  def format_datetime(datetime, type = :datetime)
    return '' unless datetime

    case type
    when :datetime
      format = '%Y年%m月%d日(%a) %H:%M:%S'
    when :date
      format = '%Y年%m月%d日(%a)'
    when
      format = '%H:%M:%S'
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
