class EcommerceController < ApplicationController

before_action :set_like, only: [:show, :edit, :update, :destroy]
	def index
		@products = Product.paginate(page: params[:page], per_page: 9).order('created_at DESC')
		@like = UserProduct.new()
		respond_to do |format|
  			format.html
  			format.js
		end
	end


	def cart
		@products = Product.joins(:user_cart_products).where('user_cart_products.user_id': current_user.id).paginate(page: params[:page], per_page: 9).order('created_at DESC')
	end

	def product_cart
		@cart = UserCartProduct.new(user_id: params[:myparam1], product_id: params[:myparam2])
		@cart.save
		head :ok
	end

	def liked
		@products = Product.joins(:user_products).where('user_products.user_id': current_user.id).paginate(page: params[:page], per_page: 9).order('created_at DESC')
	end

	def product_like
		@like = UserProduct.new(user_id: params[:myparam1], product_id: params[:myparam2])
		@like.save
		head :ok
	end

	def destroy
		@like.destroy
	end

	def destroy_product_like
		like = UserProduct.where(["user_id = ? and product_id = ?", params[:myparam1], params[:myparam2]]).all
		like.destroy_all
		head :ok
	end

	private
	def product_like_params
		params.require(:user_product).permit(:user_products_attributes => [:_destroy, :user_id, :product_id ])
	end

	 def set_like
      @like = UserProduct.find(params[:id])
    end


    def create_user_product_like
          @like.user_products.build(:user_id => current_user.id)
    end

end
