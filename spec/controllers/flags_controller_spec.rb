require 'rails_helper'
require 'spec_helper'

RSpec.describe FlagsController do

 before(:each) do
    Flag.delete_all
    @first = Flag.create({
      })
    @second = Flag.create({
      })
    @flags = [@first, @second]
    @flag = @first
  end


  describe "#index" do
    it "should send back all flags" do
      get :index
      expect(response).to be_success
      json = json(response.body)
      expect(json.length).to be Flag.all.length
    end
  end

   describe "#show" do
    it "should find back one Flag" do
      flag = Flag.find(@flag.id)
      expect(flag.id).to eq @first.id
    end
  end

   describe "#flag" do
    it "should create a new flag" do
      new_flag = Flag.create({})
      expect(Flag.all.length).to eq 3
    end
  end

  describe "#destroy" do
    it "should delete a flag" do
      flag = Flag.find(@first.id)
      flag.destroy
      expect(Flag.all.length).to eq 1
    end
  end


end
