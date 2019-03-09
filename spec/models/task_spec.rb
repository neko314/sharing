# frozen_string_literal: true

require "rails_helper"

RSpec.describe Task, type: :model  do
  before do
    @user = FactoryBot.build(:user)
    @group = @user.groups.new(id: 1, name: "test group")
  end
  context "名前が入力されている時" do
    it "タスクが登録されること" do
      task = @group.tasks.new(name: "taks")
      expect(task).to be_valid
    end
  end

  context "名前が入力されていない場合" do
    it "タスクが登録されないこと" do
      task = @group.tasks.new(name: "")
      task.valid?
      expect(task.errors[:name]).to include("can't be blank")
    end
  end
end
