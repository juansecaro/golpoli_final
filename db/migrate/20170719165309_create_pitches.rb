class CreatePitches < ActiveRecord::Migration[5.0]
  def change
    create_table :pitches do |t|
      t.string :name
      t.decimal :normal_price
      t.decimal :special_price
      t.boolean :active
      t.string :kind
      t.text :other
      t.string :image
      t.references :institution, foreign_key: true

      t.timestamps
    end
  end
end
