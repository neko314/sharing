# frozen_string_literal: true

require "rails_helper"

RSpec.describe Groups::MembershipsController, type: :controller do
  fixtures :users, :groups

  before do
    @user = users(:user1)
    @group = groups(:group1)
  end

  describe "#create" do
    context "user is find with given email"
    it "add the user to group" do
      sign_in @user
      @group.users = [@user]
      expect { patch :create, params: { group_id: @group.id, user: { "email" => "other@example.com" } } }.to change(@group.users, :count).by(1)
    end
    context "user is not found" do
      it "add no user to group" do
        sign_in @user
        expect { patch :create, params: { group_id: @group.id, user: { "email" => "incorectadress" } } }.to_not change(@group.users, :count)
      end
    end
  end
  describe "#destroy" do
    it "exits from group" do
      sign_in @user
      @group.users = [@user]
      delete :destroy, params: { id: @user.id, group_id: @group.id }
      expect(@user.groups).to_not include(@group)
    end
  end
end
