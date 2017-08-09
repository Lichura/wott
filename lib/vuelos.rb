require 'json'
require 'ostruct'

class Vuelo
	include HTTParty
	include ActiveModel::Model
	attr_accessor :desde, :hacia, :fecha_despegue, :fecha_llegada, :precio, :compania


	# def initialize(desde, hacia, fecha_despegue, fecha_llegada, precio, compania)
	# 	@desde = desde
	# 	@hacia = hacia
	# 	@fecha_despegue = fecha_despegue
	# 	@fecha_llegada = fecha_llegada
	# 	@precio = precio
	# 	@compania = compania
	# end

	def self.printer
		puts("estoy probando la clase")
	end


	def self.llamadas_de_todas_las_companias(desde, hacia, fecha)
		ryanair('BVA', 'BCN', '2017-12-15')
	end

	def self.printer
		puts("estoy probando la clase")
	end

	def self.ryanair(desde, hacia, fecha)
		puts("analizando ryanair")
		texto = "https://api.ryanair.com/farefinder/3/oneWayFares?&departureAirportIataCode=#{desde}&arrivalAirportIataCode=#{hacia}&language=en&limit=16&market=en-gb&offset=0&outboundDepartureDateFrom=#{fecha}&&outboundDepartureDateTo=#{fecha}&priceValueTo=150"
		base_uri texto
		format :json
		response = HTTParty.get(base_uri).parsed_response

		response['fares'].each do |vuelo|
			vuelos = Vuelo.new(desde: vuelo['outbound']['departureAirport']['name'], 
			hacia: vuelo['outbound']['arrivalAirport']['name'], 
			fecha_despegue: vuelo['outbound']['departureDate'], 
			fecha_llegada: vuelo['outbound']['arrivalDate'], 
			precio: vuelo['outbound']['price']['value'],
			compania: "Ryanair")
		end
	end
end