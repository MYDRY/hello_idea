class IdeasController < ApplicationController
  def show
    @idea = Idea.find(params[:id])
  end
end
