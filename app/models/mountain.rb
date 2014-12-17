class Mountain < ActiveRecord::Base
  has_many :inputs, dependent: :destroy
end
