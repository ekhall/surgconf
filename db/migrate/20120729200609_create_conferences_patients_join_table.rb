class CreateConferencesPatientsJoinTable < ActiveRecord::Migration
  def up
    create_table :conferences_patients, id: false do |t|
      t.integer :conference_id
      t.integer :patient_id
    end
    add_index :conferences_patients, [:conference_id, :patient_id]
  end

  def down
    drop_table :conferencecs_patients
  end
end
