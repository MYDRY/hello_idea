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
end
