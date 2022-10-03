require 'rails_helper'

RSpec.describe User, type: :model do
    it "is valid with valid attributes" do
        expect(User.create(email:"frari2000@gmail.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18")).to be_valid
      end
    
      it "is not valid without a title"
      it "is not valid without a description"
      it "is not valid without a start_date"
      it "is not valid without a end_date"
end