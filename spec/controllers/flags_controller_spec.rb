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
      expect(json.length).to be @flags.length
    end
  end
end
