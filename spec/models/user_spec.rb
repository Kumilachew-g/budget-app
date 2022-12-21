require 'rails_helper'

RSpec.describe User, type: :model do
    before:each do
        @user = User.new(name: "Kumilachew", email: "kumilachew@csc.et", password: "123456", password_confirmation: "123456")

    end

    it "should be valid" do
        expect(@user).to be_valid
    end

    it "name should be present" do
        @user.name = " "
        expect(@user).to_not be_valid
    end

    it "email should be present" do
        @user.email = " "
        expect(@user).to_not be_valid
    end
end