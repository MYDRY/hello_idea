# frozen_string_literal: true

class NoticesController < ApplicationController
  before_action :authorize, only: %i[index mark mark_all destroy destroy_has_read]

  def index
    @notices = current_user.notices.reverse_order
  end

  def mark
    @notice = Notice.find(params[:id])
    @notice.mark_as_read
    @notice.save
    if @notice.link.nil?
      redirect_to user_notices_path(user_id: current_user)
    else
      redirect_to @notice.link
    end
  end

  def mark_all
    @notices = current_user.notices
    @notices.each do |notice|
      notice.mark_as_read
      notice.save
    end
    redirect_to user_notices_path(user_id: current_user)
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    redirect_to user_notices_path(user_id: current_user)
  end

  def destroy_has_read
    @notices = current_user.notices.where(has_read: true)
    @notices.destroy_all unless @notices.empty?
    redirect_to user_notices_path(user_id: current_user)
  end
end
