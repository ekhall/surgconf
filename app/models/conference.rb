class Conference < ActiveRecord::Base
  attr_accessible :conf_date
  validates :conf_date, presence: true

  has_and_belongs_to_many :patients
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