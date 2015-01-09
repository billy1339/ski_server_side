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
      expect(json.length).to be @descriptions.length
    end
  end

  # describe "#show" do
  #   it "should send back one description" do
  #     get :show
  #     expect(response).to be_success
  #     json = json(response.body)
  #     expect(json.body).to be "amazing snow pack here"
  #   end
  # end

  # describe "#index" do
  #   first = Description.create()
  #   second = Description.create()
  #   it "should return all descriptions" do
  #     @descriptions = Description.all
  #     expect (@descriptions.length).to be(2)
  #   end
  # end

  # describe "#show" do
  #   it 'should return the description with id 1' do
  #     first = Description.create({body: 'excelent'})
  #     @description = Description.find(first[:id])
  #     expect (@description.body).to eq('excelent')
  #   end
  # end

  #  describe "#update" do
  #   it 'should update the description with id 1' do
  #     first = Description.create({body: 'excelent'})
  #     @description = Description.find(first[:id])
  #     @description.update(body: 'excelent!!')
  #     expect (@description.body).to eq('excelent!!')
  #   end
  # end

  # describe "#destroy" do
  #   it 'should delete the description with id 1' do
  #     first = Description.create()
  #     @description = Description.find(first[:id])
  #     @description.destroy
  #     @descriptions = Description.all
  #     expect (@descriptions.length).to eq(0)
  #   end
  # end


end
