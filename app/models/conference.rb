class Conference < ActiveRecord::Base
  attr_accessible :conf_date
  validates :conf_date, presence: true

  has_many :appearances
  has_many :patients, through: :appearances

  def appp
    Appearance.all.map(&:patient_id)
  end

  def patients_not_held
    Patient.where(["id NOT IN(?)", appearances.map(&:patient_id)])
  end
end

# == Schema Information
#
# Table name: conferences
#
#  id         :integer         not null, primary key
#  conf_date  :date
#  created_at :datetime        not null
#  updated_at :datetime        not null
#