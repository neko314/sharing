# frozen_string_literal: true

class GroupsController < ApplicationController
  def new
    @group = current_user.Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to user_path(current_user), notice: "New group created successfully"
    else
      render "new", notice: "Creating new group failed"
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def index
    @groups = current_user.groups
  end

  private
    def group_params
      params.require(:group).permit(:name)
    end
end
