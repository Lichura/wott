class UserAdress < ApplicationRecord
	belongs_to :user, :inverse_of => :user_adresses
	
end
