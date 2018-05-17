class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  def require_no_user
    logger.debug "ApplicationController::require_no_user"
    if current_user
      #store_location
      flash[:warning] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end
end
