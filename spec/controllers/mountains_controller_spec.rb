require 'rails_helper'
require 'spec_helper'

RSpec.describe MountainsController do

 before(:each) do
    Mountain.delete_all
    @first = Mountain.create({
      name: 'killington',
      longitude: 53.234523,
      latitude: 34.4364
      })
    @second = Mountain.create({
      name: 'jackson hole',
      longitude: 74.234523,
      latitude: 94.4364
      })
    @mountains = [@first, @second]
    @Mountain = @first
  end


  describe "#index" do
    it "should send back all mountains" do
      get :index
      expect(response).to be_success
      json = json(response.body)
      expect(json.length).to be @mountains.length
    end
  end
end
