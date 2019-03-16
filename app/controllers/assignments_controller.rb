# frozen_string_literal: true

class AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_assignment

  def edit
    @group = Group.find(params[:group_id])
  end

  def update
    if @assignment.update(assignment_params)
      redirect_to group_path(@assignment.task.group), notice: "Updated assignment successfully"
    else
      render "edit", alert: "Failed to update assignment"
    end
  end

  private
    def correct_user
      assignment = Assignment.find(params[:id])
      group = assignment.task.group
      redirect_to root_path, alert: "You can't access" unless group.user_ids.include?(current_user.id)
    end

    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def assignment_params
      params.require(:assignment).permit(:task_id, :user_id)
    end
end
