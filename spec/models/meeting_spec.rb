require 'rails_helper'

RSpec.describe Meeting, type: :model do
    it "is valid with valid attributes" do
        User.create(id: 100, email:"frari2000@gmail.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18")
        expect(Meeting.create(user_id: 100, name: "meeting", start_time: "Wed, 21 Sep 2022 18:35:00.000000000 UTC +00:00", end_time: "Wed, 21 Sep 2022 19:35:00.000000000 UTC +00:00")).to be_valid
    end

    it "is not valid without name" do
        User.create(id: 100, email:"frari2000@gmail.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18")
        expect(Meeting.create(user_id: 100, name: nil, start_time: "Wed, 21 Sep 2022 18:35:00.000000000 UTC +00:00", end_time: "Wed, 21 Sep 2022 19:35:00.000000000 UTC +00:00")).to be_invalid
    end

    it "is not valid without start_time" do
        User.create(id: 100, email:"frari2000@gmail.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18")
        expect(Meeting.create(user_id: 100, name: "meeting", start_time: nil, end_time: "Wed, 21 Sep 2022 19:35:00.000000000 UTC +00:00")).to be_invalid
    end

    it "is not valid without end_time" do
        User.create(id: 100, email:"frari2000@gmail.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18")
        expect(Meeting.create(user_id: 100, name: "meeting", start_time: "Wed, 21 Sep 2022 18:35:00.000000000 UTC +00:00", end_time: nil)).to be_invalid
    end

    it "is not valid if end_time is before start_time" do
        User.create(id: 100, email:"frari2000@gmail.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18")
        expect(Meeting.create(user_id: 100, name: "meeting", start_time: "Wed, 21 Sep 2022 18:35:00.000000000 UTC +00:00", end_time: "Wed, 21 Sep 2022 16:35:00.000000000 UTC +00:00")).to be_invalid
    end

    it "is valid if is unapproved" do
        User.create(id: 100, email:"frari2000@gmail.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18")
        expect(Meeting.create(user_id: 100, name: "meeting", start_time: "Wed, 21 Sep 2022 18:35:00.000000000 UTC +00:00", end_time: "Wed, 21 Sep 2022 19:35:00.000000000 UTC +00:00", is_approved: false)).to be_valid
    end

    it "is valid if approved" do
        User.create(id: 100, email:"frari2000@gmail.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18")
        expect(Meeting.create(user_id: 100, name: "meeting", start_time: "Wed, 21 Sep 2022 18:35:00.000000000 UTC +00:00", end_time: "Wed, 21 Sep 2022 19:35:00.000000000 UTC +00:00", is_approved: true, client_email: nil)).to be_valid
    end

    it "is valid if without client_email" do
        User.create(id: 100, email:"frari2000@gmail.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18")
        expect(Meeting.create(user_id: 100, name: "meeting", start_time: "Wed, 21 Sep 2022 18:35:00.000000000 UTC +00:00", end_time: "Wed, 21 Sep 2022 19:35:00.000000000 UTC +00:00", is_approved: false, client_email: nil)).to be_valid
    end

    it "is valid if with client_email" do
        User.create(id: 100, email:"frari2000@gmail.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18")
        expect(Meeting.create(user_id: 100, name: "meeting", start_time: "Wed, 21 Sep 2022 18:35:00.000000000 UTC +00:00", end_time: "Wed, 21 Sep 2022 19:35:00.000000000 UTC +00:00", is_approved: false, client_email: "example@example.com")).to be_valid
    end

    it "is valid if user has multiple meetings" do
        User.create(id: 100, email:"frari2000@gmail.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18")
        Meeting.create(user_id: 100, name: "meeting 1", start_time: "Wed, 21 Sep 2022 18:35:00.000000000 UTC +00:00", end_time: "Wed, 21 Sep 2022 19:35:00.000000000 UTC +00:00", is_approved: false, client_email: nil)
        expect(Meeting.create(user_id: 100, name: "meeting 2", start_time: "Wed, 21 Sep 2022 18:35:00.000000000 UTC +00:00", end_time: "Wed, 21 Sep 2022 19:35:00.000000000 UTC +00:00", is_approved: false, client_email: nil)).to be_valid
    end

    it "is valid if meetings have the same name" do
        User.create(id: 100, email:"frari2000@gmail.com", password: "123456", first_name: "Juan", last_name: "Cruz", age: "18")
        Meeting.create(user_id: 100, name: "meeting", start_time: "Wed, 21 Sep 2022 18:35:00.000000000 UTC +00:00", end_time: "Wed, 21 Sep 2022 19:35:00.000000000 UTC +00:00", is_approved: false, client_email: nil)
        expect(Meeting.create(user_id: 100, name: "meeting", start_time: "Wed, 21 Sep 2022 18:35:00.000000000 UTC +00:00", end_time: "Wed, 21 Sep 2022 19:35:00.000000000 UTC +00:00", is_approved: false, client_email: nil)).to be_valid
    end
end