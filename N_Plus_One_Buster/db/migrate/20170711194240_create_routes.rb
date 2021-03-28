class CreateRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :routes do |t|
      t.integer :number, null: false

      t.timestamps
    end
  end
end
