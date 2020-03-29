class Message < ApplicationRecord
  belongs_to :user
  belongs_to :receive_user,class_name:'User'

  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
