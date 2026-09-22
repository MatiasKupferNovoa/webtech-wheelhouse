class MakePromisedOnRequired < ActiveRecord::Migration[8.0]
  def change
    change_column_null :repairs, :promised_on, false
  end
end
