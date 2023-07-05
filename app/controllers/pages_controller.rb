class PagesController < ApplicationController
  def home
    render Pages::HomeView.new
  end
end
