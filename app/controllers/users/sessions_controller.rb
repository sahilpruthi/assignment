# app/controllers/registrations_controller.rb
class Users::SessionsController < Devise::SessionsController
  skip_authorization_check
 
end 