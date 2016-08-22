class CreatePresets < ActiveRecord::Migration
  def change
    create_table :presets do |t|
      t.string :name
      t.decimal :rain
      t.decimal :fire
      t.decimal :thunder
      t.decimal :crickets
      t.decimal :birds
      t.decimal :coffee
      t.decimal :waves
      t.decimal :bowl

      t.timestamps null: false
    end
  end
end
