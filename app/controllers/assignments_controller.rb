class AssignmentsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @assignment = Assignment.new
  end

  def create
    assignments_params.each do |params|
      assignment = Assignment.new(params)
      assignment.save
    end
    redirect_to user_path(current_user), notice: "Save assignemets"
  end

  def show
  end

  private
    def assignment_params
      params.require(:assignment).permit(:task_id, :user_id)
    end

    def assignments_params
      params.require(:assignments).map { |assignment_params| assignment_params.permit(:task_id, :user_id) }
    end
end
