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
        sign_in ""
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#create" do
    context "as an authenticated user" do
      it "adds a new group" do
        sign_in @user
        group_params = FactoryBot.attributes_for(:group)
        expect { post :create, params: { group: group_params } }.to change(Group, :count).by(1)
      end
    end
    context "as a guest" do
      it "can't add a new group" do
        sign_in ""
        group_params = FactoryBot.attributes_for(:group)
        expect { post :create, params: { group: group_params } }.to_not change(Group, :count)
      end
      it "redirects to sigin in page" do
        sign_in ""
        group_params = FactoryBot.attributes_for(:group)
        post :create, params: { group: group_params }
        expect(response).to redirect_to(new_user_session_path)
      end
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
      it "redirects to top page" do
        sign_in @other_user
        get :edit, params: { id: @group.id }
        expect(response).to redirect_to(root_path)
      end
    end
    context "as a guest" do
      it "returns a 302 response" do
        sign_in ""
        get :edit, params: { id: @group.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#update" do
    context "as a correct user" do
      it "updates group" do
        sign_in @user
        group_params = FactoryBot.attributes_for(:group, name: "New name")
        patch :update, params: { id: @group.id, group: group_params }
        expect(@group.reload.name).to eq("New name")
      end
    end
    context "as a wrong user" do
      it "can't update group" do
        sign_in @other_user
        group_params = FactoryBot.attributes_for(:group, name: "New name")
        patch :update, params: { id: @group.id, group: group_params }
        expect(@group.reload.name).to eq("sample family")
      end
    end
    context "as a guest" do
      it "can't update group" do
        sign_in ""
        group_params = FactoryBot.attributes_for(:group, name: "New name")
        patch :update, params: { id: @group.id, group: group_params }
        expect(@group.reload.name).to eq("sample family")
      end
    end
  end

  describe "#destroy" do
    context "as a correct user" do
      it "deletes a group" do
        sign_in @user
        expect { delete :destroy, params: { id: @group.id } }.to change(Group, :count).by(-1)
      end
    end
    context "as a wrong user" do
      it "can't be delete group" do
        sign_in @other_user
        expect { delete :destroy, params: { id: @group.id } }.to_not change(Group, :count)
      end
      it "redirects to top page" do
        sign_in @other_user
        delete :destroy, params: { id: @group.id }
        expect(response).to redirect_to(root_path)
      end
    end
    context "as a guest" do
      it "can't delete a group" do
        sign_in ""
        expect { delete :destroy, params: { id: @group.id } }.to_not change(Group, :count)
      end
      it "redirets to  sign in pgae" do
        sign_in ""
        delete :destroy, params: { id: @group.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
