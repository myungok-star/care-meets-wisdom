class AddAttachmentImageToSeniors < ActiveRecord::Migration
  def self.up
    change_table :seniors do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :seniors, :image
  end
end
