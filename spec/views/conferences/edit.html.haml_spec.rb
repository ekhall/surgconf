require 'spec_helper'

describe "conferences/edit" do
  before(:each) do
    @conference = assign(:conference, stub_model(Conference,
      :presented_patients => ""
    ))
  end

  it "renders the edit conference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => conferences_path(@conference), :method => "post" do
      assert_select "input#conference_presented_patients", :name => "conference[presented_patients]"
    end
  end
end
