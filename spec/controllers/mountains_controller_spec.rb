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
    @mountain = @first
  end


  describe "#index" do
    it "should send back all mountains" do
      get :index
      expect(response).to be_success
      json = json(response.body)
      expect(json.length).to be Mountain.all.length
    end
  end

  describe "#show" do
    it "should find back one mountain" do
      mountain = Mountain.find(@mountain.id)
      expect(mountain.name).to eq @first.name
    end
  end

  describe "#create" do
    it "should create a new mountain" do
      new_input = Mountain.create({
        name: 'big sky',
        longitude: 33.234523,
        latitude: 44.4364
      })
      expect(Mountain.all.length).to eq 3
    end
  end

  describe "#destroy" do
    it "should delete a mountain" do
      mountain = Mountain.find(@first.id)
      mountain.destroy
      expect(Mountain.all.length).to eq 1
    end
  end
end
