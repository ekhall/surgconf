require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Homepage" do
    before { visit '/static_pages/home' }
    it { should have_content('YNHCH') }
    it { should have_selector('title', text: " | Home")}
  end

end
