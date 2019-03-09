# frozen_string_literal: true

require "rails_helper"

RSpec.describe Group, type: :model  do
  before do
    @user = FactoryBot.build(:user)
    @group = @user.groups.new
  end

  it "is valid with name" do
    @group.name = "Group"
    expect(@group).to be_valid
  end

  it "is invalid without name" do
    @group.name = ""
    @group.valid?
    expect(@group.errors[:name]).to include("can't be blank")
  end
end
