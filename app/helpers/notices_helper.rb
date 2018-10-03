# coding: utf-8
module NoticesHelper
  def show_notice_link
    unread_notices = current_user.notices.where(has_read: false)
    content_tag(:a, href: user_notices_path(user_id: current_user)) do
      concat '通知 '
      unless unread_notices.empty?
        concat content_tag(:span, unread_notices.count, class: 'icon badge badge-danger')
      end
    end
  end
end
