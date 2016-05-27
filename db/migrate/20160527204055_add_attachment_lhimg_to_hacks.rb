class AddAttachmentLhimgToHacks < ActiveRecord::Migration
  def self.up
    change_table :hacks do |t|
      t.attachment :lhimg
    end
  end

  def self.down
    remove_attachment :hacks, :lhimg
  end
end
