class CreateHackTags < ActiveRecord::Migration
  def change
    create_table :hack_tags do |t|
      t.integer :hack_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
