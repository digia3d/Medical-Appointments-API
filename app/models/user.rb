class User < ApplicationRecord
  has_many :doctors, dependent: :destroy
  has_many :appointments, dependent: :destroy

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
