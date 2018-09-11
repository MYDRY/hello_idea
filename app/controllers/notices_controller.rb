class NoticesController < ApplicationController
  def index
    @notices = current_user.notices
  end
end
