require 'rails_helper'

RSpec.describe User, type: :model do
  it "ok" do
    user = User.new(email: "a@a", password: "111111", password_confirmation: "111111")
    expect(user).to be_valid
  end


  it "ng" do
    user = User.new(email: "a@@a")
    user.valid?
    expect(user.errors[:email]).to include("is invalid")
  end




  it "ng" do
    user = User.new(email: "a@@a")
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
end