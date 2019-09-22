require 'spec_helper'
require 'rails_helper'
require './app/controllers/messages/messages_get_test_controller'
RSpec.describe Messages::MessagesGetTestController, type: :controller do
  describe "GET Messages" do
    it "should return a list of messages when there are" do
      get :list
      status = response.status
      message = response.message
      expect(status).to eq(200)
      expect(message).not_to be_empty
    end      
  end
end
