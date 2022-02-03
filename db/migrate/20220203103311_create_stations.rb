class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_table :stations do |t|
      t.references :point, null: false, foreign_key: true
      t.string :sn, null: false, limit: 50
      t.index :point
      t.timestamps
    end
  end
end
