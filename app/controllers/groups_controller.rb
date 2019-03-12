# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, except: [:new, :create]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user
    if @group.save
      redirect_to @group, notice: "New group created successfully"
    else
      render "new", notice: "Creating new group failed"
    end
  end

  def show
    @group = Group.find(params[:id])
    @tasks = @group.tasks
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to @group, notice: "Updated group successfully"
    else
      render "edit", notice: "Failed to update group"
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      redirect_to root_path(current_user), notice: "Deleted a group"
    else
      render "show", notice: "Failed to delete a group"
    end
  end

  private
    def group_params
      params.require(:group).permit(:name)
    end

    def correct_user
      group = Group.find(params[:id])
      redirect_to root_path, notice: "You can't access" unless group.user_ids.include?(current_user.id)
    end
end
