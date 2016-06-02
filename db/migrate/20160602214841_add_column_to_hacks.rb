class AddColumnToHacks < ActiveRecord::Migration
  def change
  	add_column :hacks, :lhimgurl, :string
  end
end
