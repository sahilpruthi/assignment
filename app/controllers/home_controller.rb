class HomeController < ApplicationController
skip_authorization_check
	def index
		@users = User.all
		respond_to do |format|
			format.html
		end
	end
end
