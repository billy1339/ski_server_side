require 'rails_helper'
require 'spec_helper'

RSpec.describe DescriptionsController do

 before(:each) do
    Description.delete_all
    @first = Description.create({
      body: "amazing snow pack here",
      input_id: 1
      })
    @second = Description.create({
      body: "chairlift closed",
      input_id: 2
      })
    @descriptions = [@first, @second]
    @description = @first
  end


  describe "#index" do
    it "should send back all descriptions" do
      get :index
      expect(response).to be_success
      json = json(response.body)
      expect(json.length).to be Description.all.length
    end
  end

  describe "#show" do
    it "should find one description" do
      description = Description.find(@description.id)
      expect(description.body).to eq @first.body
    end
  end

  describe "#create" do
    it "should create a new description" do
      new_description = Description.create({
      body: "great skiing",
      input_id: 2
      })
      expect(Description.all.length).to eq 3
    end
  end

  describe "#destroy" do
    it "should delete a description" do
      description = Description.find(@first.id)
      description.destroy
      expect(Description.all.length).to eq 1
    end
  end


end
