class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :institution, foreign_key: true
      t.references :pitch, foreign_key: true
      t.references :user, foreign_key: true
      t.string :charge_id
      t.decimal :amount
      t.string :selected_date
      t.string :time_selections, default: ""
      t.boolean :refund, default: false
      t.string :refund_reason, default: ""
      t.decimal :refunded, default: 0
      t.string :fingerprint

      t.timestamps
    end
  end
end
