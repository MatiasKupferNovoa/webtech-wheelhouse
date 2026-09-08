class CreateRepairs < ActiveRecord::Migration[8.0]
  def change
    create_table :repairs do |t|
      t.bigint :bike_id, null: false
      t.bigint :staff_id
      t.datetime :received_at, null: false
      t.date :promised_on
      t.string :approval_status
      t.string :status, null: false, default: "received"
      t.datetime :ready_at
      t.datetime :picked_up_at
      t.timestamps
    end
  add_index :repairs, :bike_id
  add_index :repairs, :staff_id
  end
end
