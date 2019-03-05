# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    render new_user_session_path unless user_signed_in?
    current_user
  end
end
