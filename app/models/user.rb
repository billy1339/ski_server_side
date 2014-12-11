class User < ActiveRecord::Base
  has_many :inputs
  has_many :ratings
end
