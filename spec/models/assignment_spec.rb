# frozen_string_literal: true

require "rails_helper"

RSpec.describe Assignment, type: :model  do
  fixtures :tasks

  it "is valid with user_id task_id and day_id" do
    assignment = FactoryBot.build(:assignment, user_id: 1)
    expect(assignment).to be_valid
  end

  it "is valid without user_id" do
    assignment = FactoryBot.build(:assignment, user_id: "")
    expect(assignment).to be_valid
  end
end
