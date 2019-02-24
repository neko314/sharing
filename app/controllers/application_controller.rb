# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
    def after_sign_in_path_for(user)
      user_path(current_user)
    end

    # うまく動かない
    def after_sign_out_path_for(user)
      root_path
    end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
