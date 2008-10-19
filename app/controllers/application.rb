# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :put_current_user_into_model
  helper :all # include all helpers, all the time
  include AuthenticatedSystem
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'b27437ee77ee283ec6faec4a018223a3'
  filter_parameter_logging :password
  
  protected
    def admin?
      if logged_in?
        current_user.role == "Admin"
      else
        false
      end
    end
    
    def authorize
      if !logged_in?
        flash[:error] = "You are not logged in"
        redirect_to home_path
        false        
      end
    end
    
    def put_current_user_into_model
      @user = User.find_by_id(session[:user_id])
      if @user
        User.current_user = @user
      end
    end
end
