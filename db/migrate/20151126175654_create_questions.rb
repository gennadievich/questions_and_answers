class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :body
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
