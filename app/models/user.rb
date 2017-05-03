class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_attached_file :upload, styles: { default: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :upload, content_type: /\Aimage\/.*\z/

  def name
    email.split('@')[0]
  end
end
