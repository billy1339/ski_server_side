require 'rails_helper'
require 'spec_helper'

RSpec.describe InputsController do

 before(:each) do
    Input.delete_all
    @first = Input.create({
      category: "chairlift",
      latitude: 43.23523,
      longitude: 23.5232,
      url: "http://www.pictures.com"
      })
    @second = Input.create({
      category: "powder",
      latitude: 83.23523,
      longitude: 43.5232,
      url: "http://www.pictures22.com"
      })
    @inputs = [@first, @second]
    @input = @first
  end


  describe "#index" do
    it "should send back all inputs" do
      get :index
      expect(response).to be_success
      json = json(response.body)
      expect(json.length).to be @inputs.length
    end
  end

  describe "#show" do
    it "should find back one input" do
      input = Input.find(@input.id)
      expect(input.longitude).to eq @first.longitude
    end
  end

   describe "#create" do
    it "should create a new input" do
      new_input = Input.create({
      category: "chairlift",
      latitude: 44.23523,
      longitude: 13.5232,
      url: "http://www.pictursadges.com"
      })
      expect(Input.all.length).to eq 3
    end
  end

  describe "#destroy" do
    it "should delete a input" do
      input = Input.find(@first.id)
      input.destroy
      expect(Input.all.length).to eq 1
    end
  end



end
