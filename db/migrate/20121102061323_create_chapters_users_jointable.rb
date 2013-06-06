class CreateChaptersUsersJointable < ActiveRecord::Migration
  def change
	  create_table :chapters_users, :id => false do |t|
		        t.integer :chapter_id
				      t.integer :user_id
					 end

  end
end
