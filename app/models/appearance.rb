class Appearance < ActiveRecord::Base
  belongs_to :patient     #foreign key: patient_id
  belongs_to :conference  #foreign key: conference_id
end
