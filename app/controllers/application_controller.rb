class ApplicationController < ActionController::Base
 #So we can use methods inside this module
 include SessionsHelper

 # before_action :authenticate_user

   before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

private
   def require_login
    unless logged_in?
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end

 # def authenticate_user
 # 	if @current_user == nil
 # 		flash[:danger] = "Prease Log in"
 # 		redirect_to login_path

 # 	end
 # end

 #   def forbid_login_user
 #    if @current_user
 #      flash[:danger] = "すでにログインしています"
 #      redirect_to users_path
 #    end
 #  end


end
