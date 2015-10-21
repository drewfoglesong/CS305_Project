class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username
      t.string :password
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :dob

      t.timestamps null: false
    end
    add_index :admins, :username, unique: true
  end
end
