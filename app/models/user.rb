class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create { generate_token(:auth_token) }
	has_secure_password

   has_many :user_products
   has_many :products, through: :user_products



	def self.authenticate(email, password)
		user = find_by_email(email)  #.first aca habia un
		if user && user.password_hash = BCrypt::Engine.hash_secret(password, user.password_digest)
			user
		else
			nil
		end
	end

	
   	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	def send_password_reset
		generate_token(:password_reset_token)
		self.password_reset_sent_at = Time.zone.now
		save!
		UserMailer.password_reset(self).deliver_now
	end

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end
end
