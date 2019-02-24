class GroupsController < ApplicationController

  private
    def group_params
      params.requore(:group).permit(:name)
    end
end
