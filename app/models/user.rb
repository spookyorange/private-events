class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true

  has_many :created_events, foreign_key: "creator_id", class_name: "Event"

  has_many :attended_event_attendees, foreign_key: "attendee_id", dependent: :destroy
  has_many :attended_events, through: :attended_event_attendees
end
