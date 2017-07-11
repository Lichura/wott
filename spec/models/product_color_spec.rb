require 'rails_helper'

RSpec.describe ProductColor, type: :model do

	before(:each) do
		@color = Color.create(nombre: "color1")
		@familia = Family.create(name:"familia1")
		@producto = Product.create(name: "producto", family_id: 1)
	end

  it "should destroy relations betweens products on destroy" do
  	producto = Product.create(name: "producto1", family_id: 1)
  	producto1 = Product.create(name: "producto2", family_id: 1)
  	producto2 = Product.create(name: "producto3", family_id: 1)
  	productos=[producto, producto1, producto2]
  	for producto in productos
		@color.products << producto
	end
	@color.destroy
	expect(ProductColor.where(color_id: 1).length).to eql(0)
end

  it "should destroy relations betweens products on destroy" do
  	color = Color.create(nombre: "producto1")
  	color1 = Color.create(nombre: "producto2")
  	color2 = Color.create(nombre: "producto3")
  	colores=[color, color1, color2]
  	for color in colores
		@producto.colors << color
	end
	@producto.destroy
	expect(ProductColor.where(product_id: 1).length).to eql(0)
end

end