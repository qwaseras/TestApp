class AddSubtickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :is_subticket, :boolean, :default => false
    add_column :tickets, :overticket_id, :integer  
  end
end
