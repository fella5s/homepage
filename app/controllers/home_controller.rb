class HomeController < ApplicationController
  def index
    @path = "Etusivu"
    @Pages = Page.all
  end
end
