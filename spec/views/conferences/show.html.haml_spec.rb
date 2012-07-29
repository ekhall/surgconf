require 'spec_helper'

describe "conferences/show" do
  before(:each) do
    @conference = assign(:conference, stub_model(Conference,
      :presented_patients => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
