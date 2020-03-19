require 'rails_helper'

RSpec.describe User, type: :model do
  it "Passwordが6文字で、Emailが@が一つだけあり@の前後に@と空白以外が1文字ずつあれば登録できる" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  it "Passwordが5文字で登録できない" do
    user = FactoryBot.build(:user, password: "11111", password_confirmation: "11111")
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end
  #パスワード文字数上限の方は省きます
  it "passwordとpassword_confirmationが異なっていると登録できない" do
    user = FactoryBot.build(:user, password: "111111", password_confirmation: "211111")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end
  it "Emailが@がないと登録できない" do
    user = FactoryBot.build(:user, email: "aaa")
    user.valid?
    expect(user.errors[:email]).to include("is invalid")
  end
  it "Emailが@が二つあると登録できない" do
    user = FactoryBot.build(:user, email: "a@@a")
    user.valid?
    expect(user.errors[:email]).to include("is invalid")
  end
  it "Emailが途中に空白があると登録できない" do
    user = FactoryBot.build(:user, email: "a @a")
    user.valid?
    expect(user.errors[:email]).to include("is invalid")
  end
  it "2人のユーザーについて、Emailがユニークであれば登録できる" do
    FactoryBot.create(:user)
    expect(FactoryBot.build(:user, email: "b@b")).to be_valid
  end
  it "2人のユーザーについて、Emailがユニークでなければ登録できない" do
    FactoryBot.create(:user)
    user = FactoryBot.build(:user)
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end