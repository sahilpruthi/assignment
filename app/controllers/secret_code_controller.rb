class SecretCodeController < ApplicationController
	# load_and_authorize_resource
	def index
		@secret_code = SecretCode.new
		@secret_codes = SecretCode.includes(:user).all
	end

	def generate_secret_codes
		codes = SecretCode.secret_codes(params[:number_of_codes].to_i)
		codes.each do |code|
			SecretCode.create(code: 'reference'+code.to_s)
		end
		redirect_to secret_code_index_path, notice: "Codes Created Successfully" 
	end
end
