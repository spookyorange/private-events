class DeletingTableAttend < ActiveRecord::Migration[6.1]
  def change
    drop_table :attended_events_attendees
  end
end
