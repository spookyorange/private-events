class AddingTableForAttends < ActiveRecord::Migration[6.1]
  def change
    create_table :attended_event_attendees, id: false do |t|
      t.belongs_to :attendee
      t.belongs_to :attended_event
    end
  end
end
