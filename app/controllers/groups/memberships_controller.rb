# frozen_string_literal: true

module Groups
  class MembershipsController < ApplicationController
    def create
      @group = Group.find(params[:group_id])
      user = User.find_by(membership_params)
      if user.present?
        @group.users << user
        redirect_to @group, notice: "Inivited #{user.name}"
      else
        redirect_to @group, alert: "Not fount user"
      end
    end

    def destroy
      @group = Group.find(params[:group_id])
      if @group.users.delete(current_user)
        redirect_to root_path, notice: "Exit from group"
      else
        redirect_to @group, alert: "Failed to exit from group"
      end
    end

    private
      def membership_params
        params.require(:user).permit(:email)
      end
  end
end
