class NoticesController < ApplicationController
  def index
    @notices = current_user.notices
  end

  def mark
    @notice = Notice.find(params[:id])
    @notice.mark_as_read
    @notice.save
    redirect_to  user_notices_path(user_id: current_user)
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    redirect_to  user_notices_path(user_id: current_user)
  end

  def destroy_has_read
    @notices = current_user.notices.where(has_read: true)
    unless @notices.empty?
      @notices.destroy_all
    end
    redirect_to  user_notices_path(user_id: current_user)
  end
end