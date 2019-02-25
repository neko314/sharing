# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :controller do
  context "ログイン済み場合" do
    context "他ユーザーの情報" do
      it "プロフィールページを表示すると自分のページにリダイレクトされること" do
      end
      it "プロフィールを編集するとログインページにリダイレクトされること" do
      end
      it "削除するとログインページにリダイレクトされること" do
      end
    end
  end
  context "ログインしていない場合" do
    it "ログインページにリダイレクトされること" do
    end
  end
end
