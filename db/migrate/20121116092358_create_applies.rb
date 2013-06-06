class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.integer :chapter_id
      t.integer :owner_id
      t.integer :applicant_id

      t.timestamps
    end
  end
end
