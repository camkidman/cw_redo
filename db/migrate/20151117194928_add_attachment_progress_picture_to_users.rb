class AddAttachmentProgressPictureToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :progress_picture
    end
  end

  def self.down
    remove_attachment :users, :progress_picture
  end
end
