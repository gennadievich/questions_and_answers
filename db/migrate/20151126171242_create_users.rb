class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest 
      t.string :role,           :default => "user"
      t.boolean :active,        :default => false
      t.string :status,         :default => "Newbie"

      t.timestamps
    end
  end
end
