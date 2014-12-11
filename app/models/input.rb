class Input < ActiveRecord::Base
  belongs_to :user
  belongs_to :mountain
  has_many :flags
  has_many :descriptions
  has_many :ratings
end
