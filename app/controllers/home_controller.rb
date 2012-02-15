class HomeController < ApplicationController
  def index
    @path = "Etusivu"
    @pages = Page.all
    @page = Page.where(:order => 1).first
  end
end
