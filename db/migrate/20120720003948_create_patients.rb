class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :surname
      t.string :firstname
      t.date :dob
      t.string :mrn
      t.string :diagnosis
      t.text :pmhx
      t.text :rx
      t.text :vitals
      t.text :exam
      t.text :ekg
      t.text :echo
      t.text :cath
      t.text :other
      t.text :summary
      t.text :decisions

      t.timestamps
    end
    add_index :patients, [:mrn, :created_at, :surname]
  end
end
