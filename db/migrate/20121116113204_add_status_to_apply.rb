class AddStatusToApply < ActiveRecord::Migration
  def change
	  add_column	:applies, :status, :integer
  end
end
