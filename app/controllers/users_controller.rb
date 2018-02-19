class UsersController < Clearance::UsersController
  
	def user_from_params 
		name = user_params.delete (:name)
		email = user_params.delete (:email)
		password = user_params.delete (:password)


		Clearance.configuration.user_model.new(user_params).tap do |user|
			user.email = email
			user.password = password
		end
	end

	def user_params
		params[Clearance.configuration.user_paramater] || Hash.new
	end


end