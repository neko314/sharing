# frozen_string_literal: true

require "rails_helper"

RSpec.describe TasksController, type: :controller do
  context "ログインユーザーがグループのメンバーの場合" do
  end

  context "ログインユーザーがグループのメンバーではない場合" do
    it "メッセージが表示されること" do
    end
    it "プロフィールページにリダイレクトされること" do
    end
  end
end
