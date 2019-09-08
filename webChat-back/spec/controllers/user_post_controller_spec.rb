require 'spec_helper'
require 'rails_helper'
require './app/controllers/users/user_post_test_controller'
RSpec.describe Users::UserPostTestController, type: :controller do
  describe "Create User" do
    Rails.cache.clear
    it "return status 201 when user is created" do
      post :create, params: {name: "user"}
      status = response.status
      expect(status).to eq(201)
    end
    it "return status 403 when user already exists" do
      post :create, params: {name: "user"}
      status = response.status
      expect(status).to eq(403)
    end      
  end
end
 