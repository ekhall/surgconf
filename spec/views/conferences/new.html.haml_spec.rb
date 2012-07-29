require 'spec_helper'

describe "conferences/new" do
  before(:each) do
    assign(:conference, stub_model(Conference,
      :presented_patients => ""
    ).as_new_record)
  end

  it "renders new conference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => conferences_path, :method => "post" do
      assert_select "input#conference_presented_patients", :name => "conference[presented_patients]"
    end
  end
end
