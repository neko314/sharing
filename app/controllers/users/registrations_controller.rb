# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def update
    if current_user.update
      redirect_to root_path
    end
  end
end
