module ApplicationHelper
  def format_datetime(datetime, type = :datetime)
    return '' unless datetime

    case type
    when :datetime
      format = '%Y/%m/%d %H:%M:%S'
    when :date
      format = '%Y/%m/%d'
    when
      format = '%H:%M:%S'
    end
    
    datetime.strftime(format)
  end

  def inform_validation_errors(obj)
    content_tag(:p) do
      obj.errors.full_messages.each do |message|
        concat content_tag(:div, class: 'alert alert-danger') do
          concat content_tag(:a, 'x', data: { dismiss: 'alert' })
          message
        end
      end
    end
  end
end
