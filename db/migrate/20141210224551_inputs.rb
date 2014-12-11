class Inputs < ActiveRecord::Migration
  def change
    create_table :inputs do |t|
      t.text :type
      t.belongs_to :user, index: true
      t.belongs_to :mountain, index: true
      t.timestamps
    end
  end
end
