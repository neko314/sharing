# frozen_string_literal: true

require "rails_helper"

RSpec.describe Task, type: :model  do
  before do
    @group = FactoryBot.build(:group)
  end

  it "is valid with name" do
    task = @group.tasks.new(name: "taks")
    expect(task).to be_valid
  end

  it "is invalid without name" do
    task = @group.tasks.new(name: "")
    task.valid?
    expect(task.errors[:name]).to include("can't be blank")
  end
end
