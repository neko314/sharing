# frozen_string_literal: true

require "rails_helper"

RSpec.describe TasksController, type: :controller do
  fixtures :users, :groups

  before do
    @user = users(:user1)
    @other_user = users(:user2)
    @group = groups(:group1)
    @group.users = [@user]
  end

  describe "#new" do
    context "as a correct user" do
      it "responds successfully" do
        sign_in @user
        get :new, params: { group_id: @group.id }
        expect(response).to be_truthy
      end
    end
    context "as a wrong user" do
      it "redirects to top page" do
        sign_in @other_user
        get :new, params: { group_id: @group.id }
        expect(response).to redirect_to(root_path)
      end
    end
    context "as a guest" do
      it "redirects to sign in page" do
        sign_in ""
        get :new, params: { group_id: @group.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#create" do
    context "as a correct user" do
      it "adds a new task" do
      end
      it "creates assingmnent of each day" do
      end
    end
    context "as a wrong user" do
      it "can't add a new task" do
      end
      it "redirects to top page" do
      end
    end
    context "as a guest" do
      it "can't add a new task" do
      end
      it "redirects to sign in page" do
      end
    end
  end

  describe "#edit" do
    context "as a correct user" do
      it "responds successfully" do
      end
    end
    context "as a wrong user" do
      it "redirects to top page" do
      end
    end
    context "as a guest" do
      it "redirects to sign in page" do
      end
    end
  end

  describe "#update" do
    context "as a correct user" do
      context "to change name" do
        it "updates task name" do
        end
      end
      context "selection more day" do
        it "adds days to task" do
        end
      end
      context "cancel a day" do
        it "remove day from task" do
        end
      end
    end
    context "as a wrong user" do
      it "can't update day" do
      end
      it "redirects to top page" do
      end
    end
    context "as a guest" do
      it "can't update day" do
      end
      it "redirects to sign in page" do
      end
    end
  end

  describe "#destroy" do
    context "as a correct user" do
      it "deletes a task" do
      end
      it "deletes assignments too" do
      end
    end
    context "as a wrong user" do
      it "can't delete a task" do
      end
      it "redirects to top page" do
      end
    end
    context "as a guest" do
      it "can't delete a task" do
      end
      it "redirects to sign in page" do
      end
    end
  end
end
