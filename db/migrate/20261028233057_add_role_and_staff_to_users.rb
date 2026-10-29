class AddRoleAndStaffToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :role, :string, null: false, default: "mechanic"

    add_reference :users, :staff,
                  null: true,
                  foreign_key: { to_table: :staffs },
                  index: { unique: true }
  end
end
