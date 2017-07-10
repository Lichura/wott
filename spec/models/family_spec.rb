require 'rails_helper'

RSpec.describe Family, type: :model do

	before(:each) do
		@familia = Family.create(name: "familia1", description: "esto es una nueva familia")
		@producto = Product.create(name: "producto", family_id: 1)
	end

  it "should create a new family" do
  	expect(@familia).to_not be_nil
  end

  it "should not accept a duplicated name" do
	  familia1 = Family.create(name: "familia1")
      expect(familia1).to be_invalid
      expect(familia1.errors[:name]).to eql(["has already been taken"])
  end

  it "should have one product attached" do
  	expect(@familia.products.first.name).to eql("producto")
  end
 
  it "should have some products attached" do
  	producto = Product.create(name: "producto1", family_id: 1)
  	producto1 = Product.create(name: "producto2", family_id: 1)
  	producto2 = Product.create(name: "producto3", family_id: 1)
  	expect(@familia.products.length).to be == 4
  end
end
