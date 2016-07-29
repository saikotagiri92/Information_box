# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
InformationHouse::Application.initialize!
ActionMailer::Base.default :from => 'Information Box <donotreply@informationbox.com>'
ActionMailer::Base.smtp_settings = {
    user_name: 'postmaster@sandbox12629.mailgun.org',
    password: '3-so1geq3-l6',
    address: 'smtp.mailgun.org',
    port: 587,
    domain: 'sandbox12629.mailgun.org',
    authentication: "plain",
    enable_starttls_auto: true
}

InformationHouse::Application.configure do
	config.action_controller.session_store = :active_record_store #store session in db
	
    config.action_controller.session = {
 		:session_key => '_KB_App_session', #has to mach over all instances
 		:secret => 'a0a00ffc02faf7c906c7389034ad20db8e84f4cc2134bafeab033f92a46b906ed60abc2046bb3dbde860e84d2f640e9ff7a0e4491519ad261752a874942f5d31'
 		#has to mach over all instances
	}
end