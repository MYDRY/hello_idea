# frozen_string_literal: true

class SeasController < ApplicationController
  def index
    @seas = Sea.all
  end
end
