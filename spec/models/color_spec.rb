require 'rails_helper'

RSpec.describe Color, type: :model do

	before(:each) do
		@color = Color.create(nombre: "color1")
		@producto = Product.create(name: "producto", family_id: 1)
		@asociacion = ProductColor.create(product_id: 1, color_id: 1)
	end

  it "should create a new color" do
  	expect(@color).to_not be_nil
  end

  it "should not accept a duplicated name" do
	  color = Color.create(nombre: "color1")
      expect(color).to be_invalid
      expect(color.errors[:nombre]).to eql(["has already been taken"])
  end

  it "should have one product attached" do
  	expect(@color.products.first.name).to eql("producto")
  end
 
  it "should have some products attached" do
  	color = Product.create(name: "producto1", family_id: 1, color_ids: [1])
  	color1 = Product.create(name: "producto2", family_id: 1, color_ids: [1])
  	color2 = Product.create(name: "producto3", family_id: 1, color_ids: [1])
  	@color << color
  	expect(@color.products.length).to be == 2
  end
end