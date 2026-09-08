class CreateRepairServices < ActiveRecord::Migration[8.0]
  def change
    create_table :repair_services do |t|
      t.bigint :repair_id, null: false
      t.bigint :service_id, null: false
      t.decimal :price_charged, precision: 10, scale: 2, null: false
      t.timestamps
    end
  add_index :repair_services, :repair_id
  add_index :repair_services, :service_id
  add_index :repair_services, [ :repair_id, :service_id ], unique: true
  end
end
