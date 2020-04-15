class Training < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :start_time, presence: true
  # def start_time
  #   self.start_time
  # end
end
