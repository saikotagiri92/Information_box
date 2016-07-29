module Constraints
	class SubdomainRequired
		def self.matches?(request)
			request.subdomain.present? && request.subdomain != "www"
			request.subdomain.present? && request.subdomain != "app"
		end
	end
end