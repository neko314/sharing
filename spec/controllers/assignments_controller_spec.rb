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
    context "as a wrong user" do
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
    context "as a correct user" do
      it "updates assignment" do
        sign_in @user
        @assignment.user_id = @user.id
        assignment_params = FactoryBot.attributes_for(:assignment, user_id: @other_user.id)
        patch :update, params: { id: @assignment.id, group_id: @group.id, assignment: assignment_params }
        @assignment.reload
        p @assignment.user
        expect(@assignment.user).to eq(@other_user)
      end
    end
    context "as a wrong user" do
      it "can't update assignment" do
        sign_in @non_member
        @assignment.user_id = @user.id
        assignment_params = FactoryBot.attributes_for(:assignment, user_id: @other_user.id)
        patch :update, params: { id: @assignment.id, group_id: @group.id, assignment: assignment_params }
        @assignment.reload
        expect(@assignment.user).to_not eq(@other_user)
      end
      it "redirects to top page" do
        sign_in @non_member
        @assignment.user_id = @user.id
        assignment_params = FactoryBot.attributes_for(:assignment, user_id: @other_user.id)
        patch :update, params: { id: @assignment.id, group_id: @group.id, assignment: assignment_params }
        expect(response).to redirect_to(root_path)
      end
    end
    context "as a guest" do
      it "can't update assignment" do
        sign_in ""
        @assignment.user_id = @user.id
        assignment_params = FactoryBot.attributes_for(:assignment, user_id: @other_user.id)
        patch :update, params: { id: @assignment.id, group_id: @group.id, assignment: assignment_params }
        expect(@assignment.reload.user).to_not eq(@other_user)
      end
      it "redirects to sign in page" do
        sign_in ""
        @assignment.user_id = @user.id
        assignment_params = FactoryBot.attributes_for(:assignment, user_id: @other_user.id)
        patch :update, params: { id: @assignment.id, group_id: @group.id, assignment: assignment_params }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
