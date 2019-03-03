class ExitsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    if @group.users.delete(current_user)
      redirect_to current_user, notice: "Exit from group"
    else
      render @group, alert: "Failed to exit from group"
    end
  end

  private
    def exit_params
      params.require(:user).permit(:email)
    end
end
