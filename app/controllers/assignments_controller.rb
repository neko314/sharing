# frozen_string_literal: true

class AssignmentsController < ApplicationController
  def edit
    @group = Group.find(params[:group_id])
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])

    if @assignment.update(assignment_params)
      redirect_to group_path(@assignment.task.group), notice: "Updated assignment successfully"
    else
      render "edit", alert: "Failed to update assignment"
    end
  end

  private
    def assignment_params
      params.require(:assignment).permit(:task_id, :user_id)
    end
end