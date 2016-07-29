class DashboardController < ApplicationController
	def knowledgebox
		if user_signed_in?
			if request.subdomain!="app"
				if @organisation != nil
					redirect_to organisation_show_url(:subdomain => request.subdomain.gsub('.app', ''))
				end
			else
			end
		else

		end	
	end

end
