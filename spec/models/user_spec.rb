require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create valid user' do
    user = User.create({
      email: "jaeyoung@email.com",
      name: "Jaeyoung Kim",
      password: "123456",
      password_confirmation: "123456"
    })
    expect(user).to be_valid
  end
  it 'should be between 6-40 char' do
    user = User.create({
      email: "jaeyoung@email.com",
      name: "Jaeyoung Kim",
      password: "12345",
      password_confirmation: "12345"
    })
    expect(user).to_not be_valid
  end
    it 'should be unique' do
    user1 = User.create({
      email: "jaeyoung@email.com",
      name: "Jaeyoung Kim",
      password: "123456",
      password_confirmation: "123456"
    })
    user2 = User.create({
      email: "jaeyoung@email.com",
      name: "Jaeyoung Kim",
      password: "123456",
      password_confirmation: "123456"
    })
    expect(user2).to_not be_valid
  end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should create valid user' do
    user = User.create({
      email: "  jaeyoung@email.com  ",
      name: "Jaeyoung Kim",
      password: "123456",
      password_confirmation: "123456"
    })
    expect(user).to be_valid
  end
  end
end
