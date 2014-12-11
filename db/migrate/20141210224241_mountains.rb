class Mountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
      t.text :name
      t.float :longitude
      t.float :latitude
      t.timestamps
    end
  end
end
