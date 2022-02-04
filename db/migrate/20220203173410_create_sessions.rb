class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.references :connector, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.decimal :charged, precision: 10, scale: 3
      t.datetime :started_at, null: false
      t.datetime :finished_at

      t.timestamps
    end
  end
end
