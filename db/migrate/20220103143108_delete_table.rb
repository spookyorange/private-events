class DeleteTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :events_users
  end
end
