# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model  do
  it "is valid with name" do
    user = FactoryBot.build(:user, name: "testuser")
    expect(user).to be_valid
  end

  it "is invalid without name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
end
