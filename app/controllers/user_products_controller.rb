class UserProductsController < ApplicationController

	def new
		@like = UserProduct.new()
	end

	def create
		@like = UserProduct.new(like_params)
		head :ok
	end

	def destroy

	end

	private

	def like_params
		params.require(:user_product).permit(:_destroy, :user_id, :product_id)
	end
end