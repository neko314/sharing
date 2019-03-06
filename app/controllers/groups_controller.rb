# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: %i(show index destroy)

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

  def index
    @groups = current_user.groups
  end

  private
    def group_params
      params.require(:group).permit(:name)
    end

    def correct_user
      group = Group.find(params[:id])
      redirect_to current_user, notice: "You can't access" unless group.user_ids.include?(current_user.id)
    end
end
