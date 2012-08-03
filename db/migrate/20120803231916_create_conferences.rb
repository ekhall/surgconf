class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.date :conf_date

      t.timestamps
    end
    add_index :conferences, [:conf_date, :created_at]
  end
end