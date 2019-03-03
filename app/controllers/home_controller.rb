# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    console
    if user_signed_in?
      redirect_to current_user
    end
  end
end
