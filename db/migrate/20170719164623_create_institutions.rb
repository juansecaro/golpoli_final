class CreateInstitutions < ActiveRecord::Migration[5.0]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :cif
      t.string :address
      t.text :description
      t.integer :postal_code
      t.string :city
      t.string :country
      t.string :bank
      t.string :bank_no
      t.string :paypal
      t.string :img_source

      t.timestamps
    end
  end
end
