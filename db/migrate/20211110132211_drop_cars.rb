class DropCars < ActiveRecord::Migration[6.1]
  def change
    drop_table :cars
  end
end
