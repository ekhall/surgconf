class CreateAppearances < ActiveRecord::Migration
  def change
    create_table :appearances do |t|
      t.integer :conference_id
      t.integer :patient_id

    t.timestamps
    end

  end
end
