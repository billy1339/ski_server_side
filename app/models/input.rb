class Input < ActiveRecord::Base
  belongs_to :user
  belongs_to :mountain
  has_many :flags, counter_cache:true
  has_many :descriptions
  has_many :ratings, counter_cache:true
end
