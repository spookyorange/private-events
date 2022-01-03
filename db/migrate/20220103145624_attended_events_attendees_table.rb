class AttendedEventsAttendeesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :attended_events_attendees
    create_table :attended_events_attendees, id: false do |t|
      t.belongs_to :attended_event
      t.belongs_to :attendee
    end
  end
end
