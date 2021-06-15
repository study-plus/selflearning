class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :subject_name
      t.text :content
      t.integer :user_id
      t.integer :hour
      t.integer :minutes

      t.timestamps
    end
  end
end
