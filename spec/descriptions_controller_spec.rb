require_relative 'rails_helper'
# require_relative 'spec_helper'
# require_relative '../app/controllers/descriptions_controller.rb'

RSpec.describe DescriptionsController, :type => :controller do

 # before(:each) do
 #    @my_node = Node.new
 #  end

  describe "#create" do
    it "should create a new description" do
      @description = Description.create({body: 'great snow!'})
      expect(@description.body).to eq('great snow!')
    end
  end

  describe "#index" do
    first = Description.create()
    second = Description.create()
    it "should return all descriptions" do
      @descriptions = Description.all
      expect (@descriptions.length).to be(2)
    end
  end

  describe "#show" do
    it 'should return the description with id 1' do
      first = Description.create({body: 'excelent'})
      @description = Description.find(first[:id])
      expect (@description.body).to eq('excelent')
    end
  end

   describe "#update" do
    it 'should update the description with id 1' do
      first = Description.create({body: 'excelent'})
      @description = Description.find(first[:id])
      @description.update(body: 'excelent!!')
      expect (@description.body).to eq('excelent!!')
    end
  end

  describe "#destroy" do
    it 'should delete the description with id 1' do
      first = Description.create()
      @description = Description.find(first[:id])
      @description.destroy
      @descriptions = Description.all
      expect (@descriptions.length).to eq(0)
    end
  end


end
