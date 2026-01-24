class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :description, presence: true, length: { in: 5..150 }

  validates :date_of_appointment,
            presence: true,
            inclusion: { in: Time.zone.today..(Time.zone.today + 5.years) }

  validates :time_of_appointment,
            presence: true,
            format: { with: /\A\d{2}:\d{2}\z/ }
end
