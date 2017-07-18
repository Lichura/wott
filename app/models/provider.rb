class Provider < ApplicationRecord
	has_many :product_providers
	has_many :products, through: :product_providers

	validates :name, presence: true, uniqueness: true
	validates :nif, presence: true, uniqueness: true
end
