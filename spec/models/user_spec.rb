require 'rails_helper'

RSpec.describe User, type: :model do
    it "is valid with valid attributes" do
        expect(User.create(email:"frari2000@gmail.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18")).to be_valid
    end
    
    it "is not valid without an email" do
        expect(User.create(email: nil, password: "123456", first_name: "Juan", last_name: "Cruz", age: "18")).to be_invalid
    end
    
    it "is not valid without a password" do
        expect(User.create(email: "frari2000@gmail.com", password: nil, first_name: "Juan", last_name: "Cruz", age: "18")).to be_invalid
    end

    it "is not valid without a first name" do
        expect(User.create(email: "frari2000@gmail.com", password: "123456", first_name: nil, last_name: "Cruz", age: "18")).to be_invalid
    end

    it "is not valid without a last name" do
        expect(User.create(email: "frari2000@gmail.com", password: "123456", first_name: "Juan", last_name: nil, age: "18")).to be_invalid
    end

    it "is not valid withohut an age" do
        expect(User.create(email: "frari2000@gmail.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: nil)).to be_invalid
    end
end