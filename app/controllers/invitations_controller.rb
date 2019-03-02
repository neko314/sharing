class InvitationsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    user = User.find_by(invitation_params)
    binding.irb
    if user.present?
      @group.users << user, notice: "Inivited #{user.name}"
    else
      render @group, notice: "Couldn't find user"
    end
  end

  private
    def invitation_params
      params.require(:user).permit(:email)
    end
end
