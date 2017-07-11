class Color < ApplicationRecord
	has_many :product_colors, dependent: :destroy
	has_many :products, through: :product_colors

	validates :nombre, uniqueness: true
end
