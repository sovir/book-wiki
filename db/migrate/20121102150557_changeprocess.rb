class Changeprocess < ActiveRecord::Migration
  def up
	add_column	:chapters,	:processing,	:integer, default:0
  end

  def down
  end
end
