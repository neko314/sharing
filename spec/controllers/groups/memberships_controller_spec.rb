# frozen_string_literal: true

require "rails_helper"

RSpec.describe Groups::MembershipsController, type: :controller do
  describe "#create" do
    context "user is find with given email"
    it "add the user to group" do
    end
    context "user is not found" do
      it "add no user to group" do
      end
    end
  end
  describe "#destroy" do
    it "exit from group" do
    end
  end
end
