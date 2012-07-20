class Patient < ActiveRecord::Base
  attr_accessible :surname, :firstname, :mrn, :dob 
  attr_accessible :pmhx, :rx, :vitals
  attr_accessible :cath, :diagnosis, :echo, :ekg, :exam, :other 
  attr_accessible :summary, :decisions

  validates :surname, :firstname, presence: true, length: { maximum: 30 }
  validates :mrn, presence: true, uniqueness: { case_sensitive: false }
  validates :dob, presence: true

end
