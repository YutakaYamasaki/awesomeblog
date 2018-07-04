module SessionsHelper
 def log_in(user)
 	session[:user_id] = user.id
 end

#return User object or nil
 def current_user
 	@current_user ||=  User.find_by(id: session[:user_id])
 	# if  @current_user.nil?
 	# 	@current_user = User.find_by(id: session[:user_id])
 	# else
 	# 	@current_user
 	# end
 	
 end

 def logged_in?
 	! current_user.nil?
 end

 def log_out
 	session.delete(:user_id)
 	flash[:info] = "You successfully logged out"
 end

 def current_user?(user)
 	current_user == user
 end

 def store_location
 session[:forwading_url]  = request.url
 end
 def redirect_back_or(default)
 	redirect_to(session[:forwading_url] || default)
 	session.delete(:forwading_url)
 end
end