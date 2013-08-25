class WelcomesController < ApplicationController

  def index
    @artists = params[:artists] if params.key?(:artists)
  end
end
