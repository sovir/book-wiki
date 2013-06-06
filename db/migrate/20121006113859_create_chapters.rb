class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.text :content
      t.integer :loved_book_id

      t.timestamps
    end
  end
end
