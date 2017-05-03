class AddAttachmentUploadToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.attachment :upload
    end
  end

  def self.down
    remove_attachment :users, :upload
  end
end
