class EcommerceController < ApplicationController
skip_before_action :authenticate_user!, :only => [:index]
	def index
		@products = Product.paginate(page: params[:page], per_page: 9).order('created_at DESC')
		respond_to do |format|
  			format.html
  			format.js
		end
	end
end
