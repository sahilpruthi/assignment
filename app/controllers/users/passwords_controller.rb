# app/controllers/registrations_controller.rb
class Users::PasswordsController < Devise::PasswordsController
  skip_authorization_check
 
end 