# frozen_string_literal: true

require "rails_helper"

RSpec.describe AssignmentsController, type: :controller do
  fixtures :users, :groups, :assignments

  before do
    @user = users(:user1)
    @other_user = users(:user2)
    @non_member = users(:user3)
    @group = groups(:group1)
    @group.users = [@user, @other_user]
    @assignment = assignments(:assignment1)
  end

  describe "#edit" do
    context "as a correct user" do
      it "responds successfully" do
        sign_in @user
        get :edit, params: { id: @assignment.id, group_id: @group.id }
        expect(response).to be_truthy
      end
    end
    context "as awrong user" do
      it "resirects to top page" do
        sign_in @non_member
        get :edit, params: { id: @assignment.id, group_id: @group.id }
        expect(response).to redirect_to(root_path)
      end
    end
    context "as a guest" do
      it "redirects to sign in page" do
        sign_in ""
        get :edit, params: { id: @assignment.id, group_id: @group.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#update" do
    context "as acorrect user" do
      it "updates assignment" do
      end
    end
    context "as awrong user" do
      it "can't update assignment" do
      end
      it "redirects to top page" do
      end
    end
    context "as a guest" do
      it "can't update assignment" do
      end
      it "redirects to sign in page" do
      end
    end
  end
end
