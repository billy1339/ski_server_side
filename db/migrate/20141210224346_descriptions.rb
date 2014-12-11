class Descriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.text :body
      t.belongs_to :input, index: true, counter_cache: :count_of_comments
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
