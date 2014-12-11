class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :username, unique: true, null: false
      t.text :email, null: false
      t.string :password_digest
      t.string :token
      t.timestamps
    end
  end
end
