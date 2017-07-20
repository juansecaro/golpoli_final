class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :job_title
      t.text :other
      t.references :institution, foreign_key: true

      t.timestamps
    end
  end
end
