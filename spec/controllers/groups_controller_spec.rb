# frozen_string_literal: true

require "rails_helper"

RSpec.describe GroupsController, type: :controller do
  context "#create" do
    context "名前が入力されている場合" do
      it "新規登録できること" do
      end
      it "ログインユーザーが紐付いていること" do
      end
      it "ユーザーページにリダイレクトすること" do
      end
    end

    context "名前が空欄の場合" do
      it "登録できないこと" do
      end
      it "新規作成ページに戻ること" do
      end
    end
  end
  
  context "ログインユーザーがグループのメンバーの場合" do
    context "#show" do
      it "ページが表示されること" do
      end
    end
    context "#edit" do
      it "編集ページが表示されること" do
      end
    end
    context "#update" do
      it "情報が更新されること" do
      end
    end
    context "#destroy" do
      it "削除されること" do
      end
    end
  end

  context "ログインユーザーがグループのメンバーでない場合" do
    it "ページが表示されないこと" do
    end
    it "メッセージが表示されること" do
    end
    it "プロフィールページにリダイレクトされること" do
    end
  end
end
