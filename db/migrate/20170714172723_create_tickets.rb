class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :content
      t.integer :user_id
      t.string :answer

      t.timestamps
    end
    add_index :tickets, [:user_id]
  end
end
