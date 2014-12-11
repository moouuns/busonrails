class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login, except: [:accueil]
  

def require_admin
  if !logged_in?
    session[:return_to_url] = request.url if Config.save_return_to_url
    self.send(Config.not_authenticated_action)
  else 
  	redirect_to main_app.root_path unless current_user.is_admin? 
  end
end



private
  def not_authenticated
  	redirect_to main_app.new_user_session_path, alert: "Merci de vous connecter"
	end
end
