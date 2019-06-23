# app/controllers/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  skip_authorization_check
  def new
    super
  end

  def create
  	resource = User.new(user_params)
  	if resource.save
  		used_code = SecretCode.find_by(code: user_params[:code])  		
			used_code.update_attributes(user_id: resource.id) if used_code.present?
			redirect_to root_path
		else
			super
  	end

  end

  def update
    super
  end

  def user_params
  	params.require(:user).permit(:email, :first_name, :last_name, :code, :password, :password_comnfirmation)
  end	
end 