class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :description, presence: true, length: { in: 5..150 }

  validates :scheduled_at, presence: true
end
