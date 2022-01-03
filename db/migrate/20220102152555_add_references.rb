class AddReferences < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :creator_id, :integer
  
    create_table :events_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :event
    end
  end
end
