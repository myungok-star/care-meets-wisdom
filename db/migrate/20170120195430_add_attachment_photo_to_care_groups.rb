class AddAttachmentPhotoToCareGroups < ActiveRecord::Migration
  def self.up
    change_table :care_groups do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :care_groups, :photo
  end
end
