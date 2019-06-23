class SecretCode < ApplicationRecord
	belongs_to :user, optional: true

	def self.secret_codes number_of_code
		generated_codes = SecretCode.count
	  generate_codes = generated_codes + 1
	  number_of_code = number_of_code + generated_codes
		generate_codes = (generate_codes..number_of_code).sort{ rand() - 0.5 }
	end
end
