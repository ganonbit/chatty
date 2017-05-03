class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  # This method associates the attribute ":banner_image" with a file attachment
  has_attached_file :upload, styles: {attachment: '400x400>'}, storage: :s3, s3_credentials: $s3_credentials, :s3_protocol => :https, :path => "/:filename"
  validates_attachment_content_type :upload, content_type: /\Aimage\/.*\z/

  def name
    email.split('@')[0]
  end
end
