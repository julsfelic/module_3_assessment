class SearchController < ApplicationController
  def index
    @headphones = Headphone.find_by(name: params[:search][:name])
  end
end
