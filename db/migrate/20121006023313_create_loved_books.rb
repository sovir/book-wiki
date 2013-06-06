class CreateLovedBooks < ActiveRecord::Migration
  def change
    create_table :loved_books do |t|
      t.string :book_name
      t.text :book_description
      t.integer :user_id

      t.timestamps
    end
		add_index :loved_books, [:user_id, :created_at]
  end
end
