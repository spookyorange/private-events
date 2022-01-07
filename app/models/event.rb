class Event < ApplicationRecord
  validates :name, presence: true
  validates :event_date, presence: true
  validates :details, presence: true, length: { minimum: 10 }
  validates :location, presence: true

  scope :past, -> { where('event_date < ?', Time.now) }
  scope :future, -> { where('event_date > ?', Time.now) }

  belongs_to :creator, class_name: "User"

  has_many :attended_event_attendees, foreign_key: "attended_event_id", dependent: :destroy
  has_many :attendees, through: :attended_event_attendees
end
