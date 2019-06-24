class SecretCodeController < ApplicationController
	def index
		@secret_code = SecretCode.new
		@secret_codes = SecretCode.includes(:user).all
    authorize! :index, @secret_codes
	end

	def generate_secret_codes
		codes = SecretCode.secret_codes(params[:number_of_codes].to_i)
    authorize! :generate_secret_codes, codes
		codes.each do |code|
			SecretCode.create(code: 'reference'+code.to_s)
		end
		redirect_to secret_code_index_path, notice: "Codes Created Successfully" 
	end
end
