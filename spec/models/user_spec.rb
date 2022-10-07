require 'rails_helper'

RSpec.describe User, type: :model do
    it "is valid with valid attributes" do
        expect(User.create(email:"example@example.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18")).to be_valid
    end
    
    it "is not valid without an email" do
        expect(User.create(email: nil, password: "123456", first_name: "Juan", last_name: "Cruz", age: "18")).to be_invalid
    end

    it "is not valid with a role not within the range of 0 to 1" do
        expect(User.create(email: "example@example.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18", role: 2)).to be_invalid
    end

    it "is valid with a role of 0" do
        expect(User.create(email: "example@example.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18", role: 0)).to be_valid
    end

    it "is valid with a role of 1" do
        expect(User.create(email: "example@example.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18", role: 1)).to be_valid
    end
    
    it "is not valid without a password" do
        expect(User.create(email: "example@example.com", password: nil, first_name: "Juan", last_name: "Cruz", age: "18")).to be_invalid
    end

    it "is not valid with a password less than 6 characters" do
        expect(User.create(email: "example@example.com", password: "12345", first_name: "Juan", last_name: "Cruz", age: "18")).to be_invalid
    end

    it "is not valid without a first name" do
        expect(User.create(email: "example@example.com", password: "123456", first_name: nil, last_name: "Cruz", age: "18")).to be_invalid
    end

    it "is not valid without a last name" do
        expect(User.create(email: "example@example.com", password: "123456", first_name: "Juan", last_name: nil, age: "18")).to be_invalid
    end

    it "is not valid without an age" do
        expect(User.create(email: "example@example.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: nil)).to be_invalid
    end

    it "is valid with an image uploaded" do
        expect(User.create(email: "example@example.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18", image_data: "{\"id\":\"ed386fda92b61af235d5926729a93f57.png\",\"storage\":\"store\",\"metadata\":{\"filename\":\"square.png\",\"size\":127496,\"mime_type\":\"image/png\",\"width\":437,\"height\":400}}")).to be_valid
    end

    it "is invalid with a taken email" do
        User.create(email: "example@example.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18", image_data: "{\"id\":\"ed386fda92b61af235d5926729a93f57.png\",\"storage\":\"store\",\"metadata\":{\"filename\":\"square.png\",\"size\":127496,\"mime_type\":\"image/png\",\"width\":437,\"height\":400}}")
        expect(User.create(email: "example@example.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18", image_data: "{\"id\":\"ed386fda92b61af235d5926729a93f57.png\",\"storage\":\"store\",\"metadata\":{\"filename\":\"square.png\",\"size\":127496,\"mime_type\":\"image/png\",\"width\":437,\"height\":400}}")).to be_invalid
    end

    it "is valid with the same first_name and last_name" do
        User.create(email: "example1@example.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18", image_data: "{\"id\":\"ed386fda92b61af235d5926729a93f57.png\",\"storage\":\"store\",\"metadata\":{\"filename\":\"square.png\",\"size\":127496,\"mime_type\":\"image/png\",\"width\":437,\"height\":400}}")
        expect(User.create(email: "example2@example.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18", image_data: "{\"id\":\"ed386fda92b61af235d5926729a93f57.png\",\"storage\":\"store\",\"metadata\":{\"filename\":\"square.png\",\"size\":127496,\"mime_type\":\"image/png\",\"width\":437,\"height\":400}}")).to be_valid
    end
end