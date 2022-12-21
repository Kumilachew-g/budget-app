require 'rails_helper'

RSpec.describe Group, type: :model do
    before:each do
        @user = User.new(name: "Kumilachew", email: "kumilachew@csc.et", password: "123456", password_confirmation: "123456")
        @group = Group.new(name: "Category 1", icon: 'icon', user: @user)
    end

    it "Name should be valid with correct parameters " do
        expect(@group).to be_valid
    end

    it "Name should be present" do
        @group.name = ""
        expect(@group).to_not be_valid
    end

    it "Icon should be present" do
        @group.icon = ""
        expect(@group).to_not be_valid
    end

    it "User should be present" do
        @group.user = nil
        expect(@group).to_not be_valid
    end
end