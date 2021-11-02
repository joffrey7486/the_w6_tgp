class City < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :zip_code, length: { is: 5 }, presence: true
end
