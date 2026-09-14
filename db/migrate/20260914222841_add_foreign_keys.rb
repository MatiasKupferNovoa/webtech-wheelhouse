class AddForeignKeys < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :bikes, :customers, column: :customer_id
    add_foreign_key :repairs, :bikes, column: :bike_id
    add_foreign_key :repairs, :staffs, column: :staff_id
    add_foreign_key :repair_services, :repairs, column: :repair_id
    add_foreign_key :repair_services, :services, column: :service_id
  end
end
