class Personalinfo < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4, maximum: 100 }
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :blood_group, presence: true
  validates :email, presence: true, length: { minimum: 8, maximum: 100 }
  validates :mobile_number, presence: true
  validates :address, presence: true
  belongs_to :user
  has_many :articles
end
