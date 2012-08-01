class Conference < ActiveRecord::Base
  attr_accessible :conf_date
  validates :conf_date, presence: true

  has_many :appearances
  has_many :patients, through: :appearances

  def appp
    Appearance.all.map(&:patient_id)
  end

  def patients_not_held
    if Patient.where(["id NOT IN(?)", appearances.map(&:patient_id)]).any?
      Patient.where(["id NOT IN(?)", appearances.map(&:patient_id)]).order("surname ASC")
    else
      Patient.all(order: "surname ASC")
    end
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