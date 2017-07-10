require "rails_helper"




RSpec.describe Product, :type => :model do
	before(:each) do
		@familia = Family.create(name: "familia1")
    	@producto = Product.create(name: "producto1", family_id: 1)
  	end


    it "should create a new product" do
      expect(@producto).to_not be_nil
    end

    it "Product name should exists" do
      expect(@producto.name).to eql("producto1")
    end

    it "stock on new product should be 0" do
      expect(@producto.stock_reservado).to eql(0)
      expect(@producto.stock_disponible).to eql(0)
      expect(@producto.stock_pedido).to eql(0)
    end

    it "family on new product should be defined" do
      expect(@producto.family_id).to_not be_nil
      expect(@producto.family.name).to eql("familia1")
    end

    it "price on new product should be 0" do
      expect(@producto.price).to eql(0.0)
    end

    it "changing price on a product" do
      @producto.price = 20
      @producto.save
      expect(@producto.price).to eql(20.0)
    end

    it "product name can't be duplicated" do
      producto1 = Product.create(name: "producto1")
      expect(producto1).to be_invalid
      expect(producto1.errors[:name]).to eql(["has already been taken"])
    end

    it "producto should not belong to a not existing family" do
    	producto = Product.create(name: "producto2", family_id: 2)
    	expect(producto).to be_invalid
    	#expect(producto.errors[:family_id].to eql(["Family can't be blank"]))
    end
end