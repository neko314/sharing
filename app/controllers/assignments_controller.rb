class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
  end

  def create
  end

  def show
  end

  private
    def assignment_params
      params.require(:assignment).permit(:user_id)
    end
end
