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

end
