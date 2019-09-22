require 'spec_helper'
require 'rails_helper'
require './app/controllers/rooms/rooms_post_test_controller'
RSpec.describe Rooms::RoomsPostTestController, type: :controller do
  describe "Create Room" do
    Rails.cache.clear
    it "return status 201 when Room is created" do
      post :create, params: {id: "1234", name: "room1"}
      status = response.status
      expect(status).to eq(201)
    end
    it "return status 403 when Room already exists" do
      post :create, params: {id: "1234", name: "room1"}
      status = response.status
      expect(status).to eq(403)
    end      
  end
end
 