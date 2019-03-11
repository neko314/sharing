# frozen_string_literal: true

require "rails_helper"

RSpec.describe TasksController, type: :controller do
  fixtures :users, :groups, :days, :tasks

  before do
    @user = users(:user1)
    @other_user = users(:user2)
    @group = groups(:group1)
    @group.users = [@user]
    @task = tasks(:task1)
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
        sign_in @user
        task_params = FactoryBot.attributes_for(:task)
        expect { post :create, params: { group_id: @group.id, task: task_params } }.to change(@group.tasks, :count).by(1)
      end
      it "creates assingmnent" do
        sign_in @user
        task_params = [FactoryBot.attributes_for(:task), assignments_attributes: [{ day_id: 1 }, { day_id: 2 }]]
        expect { post :create, params: { group_id: @group.id, task: task_params } }.to change(@group.assignments, :count).by(2)
      end
    end
    context "as a wrong user" do
      it "can't add a new task" do
        sign_in @other_user
        task_params = FactoryBot.attributes_for(:task)
        expect { post :create, params: { group_id: @group.id, task: task_params } }.to_not change(@group.tasks, :count)
      end
      it "redirects to top page" do
        sign_in @other_user
        task_params = FactoryBot.attributes_for(:task)
        post :create, params: { group_id: @group.id, task: task_params }
        expect(response).to redirect_to(root_path)
      end
    end
    context "as a guest" do
      it "can't add a new task" do
        sign_in ""
        task_params = FactoryBot.attributes_for(:task)
        expect { post :create, params: { group_id: @group.id, task: task_params } }.to_not change(@group.tasks, :count)
      end
      it "redirects to sign in page" do
        sign_in ""
        task_params = FactoryBot.attributes_for(:task)
        post :create, params: { group_id: @group.id, task: task_params }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#edit" do
    context "as a correct user" do
      it "responds successfully" do
        sign_in @user
        get :edit, params: { group_id: @group.id, id: @task.id }
        expect(response).to be_truthy
      end
    end
    context "as a wrong user" do
      it "redirects to top page" do
        sign_in @other_user
        get :edit, params: { group_id: @group.id, id: @task.id }
        expect(response).to redirect_to(root_path)
      end
    end
    context "as a guest" do
      it "redirects to sign in page" do
        sign_in ""
        get :edit, params: { group_id: @group.id, id: @task.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#update" do
    context "as a correct user" do
      context "to change name" do
        it "updates task name" do
          sign_in @user
          task_params = FactoryBot.attributes_for(:task, name: "New name")
          patch :update, params: { id: @task.id, group_id: @group.id, task: task_params }
          binding.pry
          expect(@task.reload.name).to eq("New name")
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
        sign_in @other_user
        task_params = FactoryBot.attributes_for(:task, name: "New name")
        patch :update, params: { id: @task.id, group_id: @group.id, task: task_params }
        expect(@task.reload.name).to eq("cooking")
      end
      it "redirects to top page" do
        sign_in @other_user
        task_params = FactoryBot.attributes_for(:task, name: "New name")
        patch :update, params: { id: @task.id, group_id: @group.id, task: task_params }
        expect(response).to redirect_to(root_path)
      end
    end
    context "as a guest" do
      it "can't update day" do
        sign_in ""
        task_params = FactoryBot.attributes_for(:task, name: "New name")
        patch :update, params: { id: @task.id, group_id: @group.id, task: task_params }
        expect(@task.reload.name).to eq("cooking")
      end
      it "redirects to sign in page" do
        sign_in ""
        task_params = FactoryBot.attributes_for(:task, name: "New name")
        patch :update, params: { id: @task.id, group_id: @group.id, task: task_params }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#destroy" do
    context "as a correct user" do
      it "deletes a task" do
        sign_in @user
        expect { delete :destroy, params: { id: @task.id, group_id: @group.id } }.to change(@group.tasks, :count).by(-1)
      end
      it "deletes assignments too" do
        sign_in @user
        @task.assignments.destroy_all
        @task.assignments.create(day_id: 1)
        @task.assignments.create(day_id: 2)
        expect { delete :destroy, params: { id: @task.id, group_id: @group.id } }.to change(Assignment, :count).by(-2)
      end
    end
    context "as a wrong user" do
      it "can't delete a task" do
        sign_in @other_user
        expect { delete :destroy, params: { id: @task.id, group_id: @group.id } }.to_not change(@group.tasks, :count)
      end
      it "redirects to top page" do
        sign_in @other_user
        delete :destroy, params: { id: @task.id, group_id: @group.id }
        expect(response).to redirect_to(root_path)
      end
    end
    context "as a guest" do
      it "can't delete a task" do
        sign_in ""
        expect { delete :destroy, params: { id: @task.id, group_id: @group.id } }.to_not change(@group.tasks, :count)
      end
      it "redirects to sign in page" do
        sign_in ""
        delete :destroy, params: { id: @task.id, group_id: @group.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
