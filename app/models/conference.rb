class Conference < ActiveRecord::Base
  attr_accessible :conf_date, :appearances_attributes
  validates :conf_date, presence: true

  has_many :appearances
  accepts_nested_attributes_for :appearances, allow_destroy: true
  has_many :patients, through: :appearances

  def patients_not_held
    # Return a list of patients _not_ in this conference if any are present
    if Patient.where(["id NOT IN(?)", appearances.map(&:patient_id)]).any?
      Patient.where(["id NOT IN(?)", appearances.map(&:patient_id)]).order("surname ASC")
    # If this conference does indeed contain patients return an empty array
    elsif self.patients.any?
      Array.new
    # If No Patients in Conference AND none elsewhere then return All patients.
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