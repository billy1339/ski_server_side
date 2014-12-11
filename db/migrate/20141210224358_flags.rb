class Flags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.belongs_to :user, index: true
      t.belongs_to :input, index: true, counter_cache: :count_of_flags
      t.timestamps
    end
  end
end
