require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid" do
      Merch = Category.create 
      pokemon = Merch.products.create({
          name:  'porygon',
          description: 'computer pokemon',
          quantity: 777,
          price: 7777
        })
    expect(pokemon).to be_valid
    end
  it "has a name" do
      Merch = Category.create 
      pokemon = Merch.products.create({
          name:  nil,
          description: 'computer pokemon',
          quantity: 777,
          price: 7777
        })
    expect(pokemon).to_not be_valid
    end
  it "has a price" do
      Merch = Category.create 
      pokemon = Merch.products.create({
          name:  'porygon',
          description: 'computer pokemon',
          quantity: 777,
          price_cents: nil
        })
    expect(pokemon).to_not be_valid
    end
    it "has a quantity" do
      Merch = Category.create 
      pokemon = Merch.products.create({
          name:  'porygon',
          description: 'computer pokemon',
          quantity: nil,
          price: 7777
        })
    expect(pokemon).to_not be_valid
    end
    it "has a category" do
      Merch = Category.create 
      pokemon = Merch.products.create({
          name:  'porygon',
          description: 'computer pokemon',
          quantity: 10,
          price: 7777
        })
        pokemon.category = nil
    expect(pokemon).to_not be_valid
    end
    context "given name is missing"
    it "should have name as nil and not be valid" do
      @test_category = Category.create(name: "test category")
      @test_product = Product.create(name: nil, category: @test_category, price: 1337, quantity:1)
      expect(@test_product.name).to be_nil
      expect(@test_product).to_not be_valid
    end
    it "should get the error message including 'Name can't be blank'" do
      @test_category = Category.new
      @test_product = Product.create(name: nil, category: @test_category, price: 1337, quantity:1)
      expect(@test_product.name).to be_nil
      expect(@test_product.errors.full_messages).to include("Name can't be blank")
    end
  end
end
