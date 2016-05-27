class CreateHacks < ActiveRecord::Migration
  def change
    create_table :hacks do |t|
      t.integer :user_id
      t.string :title
      t.string :body

      t.timestamps null: false
    end
  end
end
