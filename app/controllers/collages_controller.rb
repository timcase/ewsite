class CollagesController < ApplicationController

  def index
    @url = request.url
  end

  def show
    @url = request.url
  end
end
