class Input < ActiveRecord::Base
  belongs_to :user
  belongs_to :mountain
  has_many :flags, counter_cache:true, dependent: :destroy
  has_many :descriptions, dependent: :destroy
  has_many :ratings, counter_cache:true, dependent: :destroy
end
