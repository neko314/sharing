# frozen_string_literal: true

module Groups
  class InvitationsController < ApplicationController
    def create
      @group = Group.find(params[:group_id])
      user = User.find_by(invitation_params)
      if user.present?
        @group.users << user
        redirect_to @group, notice: "Inivited #{user.name}"
      else
        redirect_to @group, alert: "Not fount user"
      end
    end

    private
      def invitation_params
        params.require(:user).permit(:email)
      end
  end
end
