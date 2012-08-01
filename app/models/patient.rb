class Patient < ActiveRecord::Base
  attr_accessible :surname, :firstname, :mrn, :dob 
  attr_accessible :pmhx, :rx, :vitals
  attr_accessible :cath, :diagnosis, :echo, :ekg, :exam, :other 
  attr_accessible :summary, :decisions

  validates :surname, :firstname, presence: true, length: { maximum: 30 }
  validates :mrn, presence: true, uniqueness: { case_sensitive: false }
  validates :dob, presence: true

  has_many :appearances
  has_many :conferences, through: :appearances

end

# == Schema Information
#
# Table name: patients
#
#  id         :integer         not null, primary key
#  surname    :string(255)
#  firstname  :string(255)
#  dob        :date
#  mrn        :string(255)
#  diagnosis  :string(255)
#  pmhx       :text
#  rx         :text
#  vitals     :text
#  exam       :text
#  ekg        :text
#  echo       :text
#  cath       :text
#  other      :text
#  summary    :text
#  decisions  :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

