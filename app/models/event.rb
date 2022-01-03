class Event < ApplicationRecord
  validates :name, presence: true
  validates :event_date, presence: true
  validates :details, presence: true, length: { minimum: 10 }
  validates :location, presence: true

  belongs_to :creator, class_name: "User"
  has_and_belongs_to_many :users
end
