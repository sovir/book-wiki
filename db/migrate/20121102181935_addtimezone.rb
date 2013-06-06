class Addtimezone < ActiveRecord::Migration
  def up
	  add_column	:chapters,	:deadline,	:datetime
  end

  def down
  end
end
