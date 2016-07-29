module Constraints
	class ControlCentreSubdomainRequired
		def self.matches?(request)
			request.subdomain.present? && request.subdomain != "www" && request.subdomain != "app" && request.subdomain == "controlcentre"
		end
	end
end