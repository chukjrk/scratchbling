class Admin::BaseController < ApplicationController
	befor_filter :ensure_admin_user!

	def ensure_admin_user!
		unless current_user and current_user.admin?
			
	end
end