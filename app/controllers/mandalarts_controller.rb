class MandalartsController < ApplicationController
  def index
    @simple_mandals = current_user.simple_mandals
  end
  
  def show
  end

  def new
    @simple_mandal = SimpleMandal.new
  end
  
  def create
  end
end
