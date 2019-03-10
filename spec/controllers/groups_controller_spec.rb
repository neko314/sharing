# frozen_string_literal: true

require "rails_helper"

RSpec.describe GroupsController, type: :controller do
  fixtures :users, :groups

  before do
    @user = users(:user1)
    @other_user = users(:user2)
    @group = groups(:group1)
    @group.users = [@user]
  end

  describe "#new" do
    context "as an authenticated user" do
      it "respondes succesfully" do
        sign_in @user
        get :new
        expect(response).to be_truthy
      end
    end
    context "as a guest" do
      it "redirects to sign in page" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#create" do
    context "as a correct user" do
    end
    context "as a wrong user" do
    end
    context "as a guest" do
    end
  end

  describe "#edit" do
    context "as a correct user" do
      it "respondes succesfully" do
        sign_in @user
        get :edit, params: { id: @group.id }
        expect(response).to be_truthy
      end
    end
    context "as a wrong user" do
      it "redirects to user page" do
        sign_in @other_user
        get :edit, params: { id: @group.id }
        expect(response).to redirect_to(root_path)
      end
    end
    context "as a guest" do
    end
  end

  describe "#update" do
    context "as a correct user" do
    end
    context "as a wrong user" do
    end
    context "as a guest" do
    end
  end

  describe "#destroy" do
    context "as a correct user" do
    end
    context "as a wrong user" do
    end
    context "as a guest" do
    end
  end
end
