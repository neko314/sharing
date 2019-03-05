# frozen_string_literal: true

require "rails_helper"

RSpec.describe Groups::InvitationsController, type: :controller do
  context "フォームに入力したメールアドレスを持つユーザーがいる場合" do
    it "グループのメンバーが増えていること" do
    end

    it "招待したユーザーの所属するグループが増えていること" do
    end

    it "メッセージが表示されること" do
    end
  end

  context "フォームに入力したメールアドレスを持つユーザーがいない場合" do
    it "グループのメンバーは増えていないこと" do
    end
    it "メッセージが表示されること" do
    end
  end
end
