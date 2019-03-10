# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :controller do
  # @request.env['devise.mapping'] = Devise.mappings[:user]

  fixtures :users
  describe "#show" do
    context "user signed in" do
      it "responds successfully" do
        sign_in users(:user1)
        get :show
        expect(response).to be_truthy
      end
    end

    context "user not signed in" do
      it "redirects to sign in page" do
        get :show
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
