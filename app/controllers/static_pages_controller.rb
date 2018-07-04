class StaticPagesController < ApplicationController
  def home
  	if logged_in?
      @microposts = current_user.feed.paginate(page: params[:page])
      # SELECT FROM microposts WHERE user_id IN([1,2,3,4])
    	# @microposts = current_user.microposts.paginate(page: params[:page],per_page:15)
    	@micropost = current_user.microposts.build
	   end
  end

  def help
    
  end
  def about
  end
end
