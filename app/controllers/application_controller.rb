class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_timezone

  def set_timezone
    Time.zone = 'Helsinki'
  end
    
end
