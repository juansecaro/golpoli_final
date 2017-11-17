class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :institution, foreign_key: true
      t.references :pitch, foreign_key: true
      t.references :user, foreign_key: true
      t.string :user_email
      t.string :charge_id, default: ""
      t.decimal :amount
      t.date :selected_date
      t.string :selected_times, default: ""
      t.boolean :refund, default: "0.0"
      t.string :refund_reason, default: ""
      t.decimal :refunded, default: false
      t.string :fingerprint

      t.timestamps
    end
  end
end
