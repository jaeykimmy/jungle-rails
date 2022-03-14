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
  end
end
