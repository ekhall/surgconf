require 'spec_helper'

describe Patient do
  pending "add some examples to (or delete) #{__FILE__}"
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

