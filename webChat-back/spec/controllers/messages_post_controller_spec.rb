require 'spec_helper'
require 'rails_helper'
require './app/controllers/messages/messages_post_test_controller'
RSpec.describe Messages::MessagesPostTestController, type: :controller do
  describe "Create Message" do
    Rails.cache.clear
    it "return status 201 when a Message is created" do
      post :create, params:{user: "user", room: "room ", message: "message"}
      status = response.status
      expect(status).to eq(201)
    end
    it "return status 403 when a Message already exists" do
      post :create, params:{user: "user", room: "room ", message: "message"}
      status = response.status
      expect(status).to eq(403)
    end      
  end
end
 