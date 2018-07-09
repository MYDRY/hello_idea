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
end
