class MandalartsController < ApplicationController
  def show
    @simple_mandal = SimpleMandal.find(params[:id])
    if @simple_mandal.nil?
      @simple_mandal = ''
    end
  end
  
  def create
    @simple_mandal = SimpleMandal.new(params[])
    @simple_mandal.user_id = current_user
    @simple_mandal.save
  end
  
  def index
      
  end
end
