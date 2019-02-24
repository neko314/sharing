class UsersController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery prepend: true

  def show
    @user = User.find(params[:id])
  end
end