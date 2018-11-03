class MandalartsController < ApplicationController
  def index
      @mandals = Mandal.all
  end
end
