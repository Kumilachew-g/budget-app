require 'rails_helper'

RSpec.describe Entity, type: :model do
    before:each do
        @user = User.new(name: "Kumilachew", email: "kumilachew@csc.et", password: "123456", password_confirmation: "123456")
        @entity = Entity.new(name: "Entity 1", amount: 1, user: @user)
        end

    it "Name should be valid with correct parameters " do
        expect(@entity).to be_valid
    end

    it "Name should be present" do
        @entity.name = ""
        expect(@entity).to_not be_valid
    end

    it "Amount should be present" do
        @entity.amount = ""
        expect(@entity).to_not be_valid
    end

    it "Amount should be greater than 0" do
        @entity.amount = 0
        expect(@entity).to_not be_valid
    end

    it "Amount should be a number" do
        @entity.amount = "a"
        expect(@entity).to_not be_valid
    end

    it "User should be present" do
        @entity.user = nil
        expect(@entity).to_not be_valid
    end
end