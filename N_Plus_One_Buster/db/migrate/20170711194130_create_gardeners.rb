class CreateGardeners < ActiveRecord::Migration[6.1]
  def change
    create_table :gardeners do |t|
      t.string :name, null: false
      t.integer :house_id

      t.timestamps
    end
    add_index :gardeners, :house_id
  end
end
