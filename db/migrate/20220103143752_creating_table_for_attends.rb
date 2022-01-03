class CreatingTableForAttends < ActiveRecord::Migration[6.1]
  def change
    create_table :attended_events_attendees, id: false do |t|
      t.belongs_to :attendee
      t.belongs_to :attended_event
    end
  end
end
