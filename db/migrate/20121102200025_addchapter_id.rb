class AddchapterId < ActiveRecord::Migration
  def up
  	add_column	:chapters,	:chapter_id,	:integer
  end

  def down
  end
end
