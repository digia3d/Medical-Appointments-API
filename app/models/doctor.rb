class Doctor < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy

  validates :name, presence: true
  validates :specialization, presence: true
  validates :photo, presence: true

end
