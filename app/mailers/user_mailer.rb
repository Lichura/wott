class UserMailer < ApplicationMailer

	default :from => "mail@caravanastrenquelauquen.com.ar"
	layout "mailer"
	
	def mailer(user)
    mail(to: user, subject: 'Welcome to My Awesome Site')
  	end
end
