class AddAttachmentAvatarToVolunteers < ActiveRecord::Migration
  def self.up
    change_table :volunteers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :volunteers, :avatar
  end
end
