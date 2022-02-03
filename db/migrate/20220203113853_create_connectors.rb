class CreateConnectors < ActiveRecord::Migration[7.0]
  def change
    create_table :connectors do |t|
      t.references :station, null: false, foreign_key: true
      t.integer :connector_type, limit: 4, null: false
      t.integer :state, limit: 4, default: 1, null: false
      t.decimal :power, precision: 10, scale: 3, null: false
      t.index :station

      t.timestamps
    end
  end
end
