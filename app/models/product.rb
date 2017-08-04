class Product < ApplicationRecord

	belongs_to :family
	has_many :product_colors, dependent: :destroy
	has_many :colors, through: :product_colors
	has_many :product_providers
	has_many :providers, through: :product_providers
	has_many :user_products
    has_many :users, through: :user_products
    has_many :user_cart_products
    has_many :users, through: :user_cart_products
	#validates_presence_of :name, :family_id
	validates :name, uniqueness: true
	validates :family_id, :presence => true
	after_initialize :set_initials

	accepts_nested_attributes_for :user_products, allow_destroy: true
accepts_nested_attributes_for :user_cart_products, allow_destroy: true

	self.per_page = 9

	def set_initials
		self.price ||= 0
		self.stock_disponible ||= 0
		self.stock_reservado ||= 0
		self.stock_pedido ||= 0
	end
end
