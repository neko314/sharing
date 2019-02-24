class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  private
    def group_params
      params.requore(:group).permit(:name)
    end
end
