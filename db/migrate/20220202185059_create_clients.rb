class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name, limit: 200, null: false
      t.string :phone_number, limit: 11, null: false
      t.index :phone_number, unique: true
      t.timestamps
    end
  end
end
