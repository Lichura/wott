require 'rails_helper'

RSpec.describe UserProduct, type: :model do
  it "should create an association between a product and a user" do
    @user = User.create(email:"nombre@mail.com", password: "123456", encrypted_password:"123456")
    @family = Family.create(name:"familia1")
    @producto = Product.create(name:"producto1", family_id: 1)
    @producto.users << @user
    expect(@producto.users.length).to eql(1)
  end

  it "a provider can be associated to a product" do
  end

  it "a provider can be associated to more than a product" do
    @user = User.create(email:"provedor1", encrypted_password:"123456")
    @familia = Family.create(name:"familia")
    producto = Product.create(name: "producto1", family_id: 1)
    producto1 = Product.create(name: "producto2", family_id: 1)
    producto2 = Product.create(name: "producto3", family_id: 1)
    productos=[producto, producto1, producto2]
    for producto in productos
      @user.products << producto
    end
    expect(@user.products.length).to eql(3)
  end

end
