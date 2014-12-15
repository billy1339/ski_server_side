class Description < ActiveRecord::Base
  belongs_to :input
  belongs_to :user
end
