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


	include HTTParty

	base_uri = "https://api.ryanair.com"
 	def self.vuelos
			base_uri 'https://api.ryanair.com/farefinder/3/oneWayFares?&departureAirportIataCode=BVA&arrivalAirportIataCode=BCN&language=en&limit=16&market=en-gb&offset=0&outboundDepartureDateFrom=2017-12-15&outboundDepartureDateTo=2017-12-17&priceValueTo=150'
			format :json

			#voy a la ruta de xml y le indico que tiene que traerme todos los items de las noticias
			#def self.datos_cliente_afip()
			response = HTTParty.get(base_uri)
			response.parsed_response
			#mail(:to => "lichun88@gmail.com", :subject => "New Post", :locals => { :vuelos => response.parsed_response })
	end

	def self.easyjet
		base_uri 'https://www.easyjet.com/ejavailability/api/v10/availability/query?AdditionalSeats=0&AdultSeats=1&ArrivalIata=BCN&ChildSeats=0&DepartureIata=%23PARIS&IncludeAdminFees=true&IncludeFlexiFares=false&IncludeLowestFareSeats=true&IncludePrices=true&Infants=0&IsTransfer=false&LanguageCode=ES&MaxDepartureDate=2017-12-15&MinDepartureDate=2017-12-15'
				format :json

			#voy a la ruta de xml y le indico que tiene que traerme todos los items de las noticias
			#def self.datos_cliente_afip()
			response = HTTParty.get(base_uri)
			response.parsed_response
	end

	def set_initials
		self.price ||= 0
		self.stock_disponible ||= 0
		self.stock_reservado ||= 0
		self.stock_pedido ||= 0
	end
end
