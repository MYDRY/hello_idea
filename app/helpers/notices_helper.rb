# frozen_string_literal: true

module NoticesHelper
  def show_notice_link
    unread_notices = current_user.notices.where(has_read: false)
    content_tag(:a, href: user_notices_path(user_id: current_user)) do
      concat '通知 '
      concat content_tag(:span, unread_notices.count, class: 'icon badge badge-danger') unless unread_notices.empty?
    end
  end
end
