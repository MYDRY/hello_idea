class MandalartsController < ApplicationController
  def index
      @simple_mandal = SimpleMandal.find_by(user_id: current_user.id)
      if @simple_mandal.nil?
          @simple_mandal = ''
      end
  end
  
  def show
      @simple_mandal = SimpleMandal.find_by(user_id: current_user.id)
      if @simple_mandal.nil?
          @simple_mandal = ''
      end
  end
  
  def create
      @simple_mandal = SimpleMandal.new
      @simple_mandal.save
  end
end
