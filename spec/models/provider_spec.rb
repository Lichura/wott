require 'rails_helper'

RSpec.describe Provider, type: :model do
  it "should create a provider" do
    @provedor = Provider.create(name:"provedor1")
    expect(@provedor.name).to eql("provedor1")
  end

  it "a provider can be associated to a product" do
    @provedor = Provider.create(name:"provedor1")
    @familia = Family.create(name:"familia")
    @producto = Product.create(name:"producto1", family_id: 1)
    @provedor.products << @producto
    expect(@provedor.products.first.name).to eql("producto1")
  end

  it "a provider can be associated to more than a product" do
    @provedor = Provider.create(name:"provedor1")
    @familia = Family.create(name:"familia")
    producto = Product.create(name: "producto1", family_id: 1)
    producto1 = Product.create(name: "producto2", family_id: 1)
    producto2 = Product.create(name: "producto3", family_id: 1)
    productos=[producto, producto1, producto2]
    for producto in productos
      @provedor.products << producto
    end
    expect(@provedor.products.length).to eql(3)
  end

  it "a provider must have a nif" do
    
  end

  it "a provider must have an email" do
  end
end
