class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :description, presence: true, length: { in: 5..150 }

  validates :scheduled_at, presence: true

  enum :status, { scheduled: "scheduled", completed: "completed", canceled: "canceled" }

  validate :scheduled_at_cannot_be_in_the_past

  def scheduled_at_cannot_be_in_the_past
    return unless scheduled_at.present? && scheduled_at < Time.current

    errors.add(:scheduled_at, "can't be in the past")
  end
end
