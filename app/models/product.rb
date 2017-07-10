class Product < ApplicationRecord

	belongs_to :family
	has_many :product_colors
	has_many :colors, through: :product_colors
	#validates_presence_of :name, :family_id
	validates :name, uniqueness: true
	validates :family_id, :presence => true
	after_initialize :set_initials



	def set_initials
		self.price ||= 0
		self.stock_disponible ||= 0
		self.stock_reservado ||= 0
		self.stock_pedido ||= 0
	end
end
