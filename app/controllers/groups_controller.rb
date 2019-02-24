# frozen_string_literal: true

class GroupsController < ApplicationController
  def new
    @group = current_user.groups.new
  end

  def create
    @group = current_user.groups.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      redirect_to user_path(current_user), notice: "New group created successfully"
    else
      render "new", notice: "Creating new group failed"
    end
  end

  private
    def group_params
      params.require(:group).permit(:name)
    end
end
