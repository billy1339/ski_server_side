class Ratings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.belongs_to :input, index: true, counter_cache: :count_of_rating
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
