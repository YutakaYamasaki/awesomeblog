class VotesController < ApplicationController
	def create
		@micropost = Micropost.find(params[:micropost_id])
		# current_user.votes.create(micropost: micropost)
		current_user.upvote(@micropost)


		# redirect_to request.referrer || root_url
		respond_to do |format|
			format.html{redirect_to root_url}
			format.js
		end
	end
	def destroy
		@micropost = Vote.find(params[:id]).micropost
		# vote.destroy

		current_user.downvote(@micropost)

		# redirect_to request.referrer || root_url
		respond_to do |format|
			format.html{redirect_to root_url}
			format.js
		end
	end
end
