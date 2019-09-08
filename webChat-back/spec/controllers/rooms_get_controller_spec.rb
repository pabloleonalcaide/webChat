require 'spec_helper'
require 'rails_helper'
require './app/controllers/rooms/rooms_get_test_controller'
RSpec.describe Rooms::RoomsGetTestController, type: :controller do
  describe "GET Rooms" do
    it "should return a list of rooms when there are" do
      get :list
      status = response.status
      message = response.message
      expect(status).to eq(200)
      expect(message).not_to be_empty
    end      
  end
end
