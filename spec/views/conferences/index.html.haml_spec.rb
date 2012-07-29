require 'spec_helper'

describe "conferences/index" do
  before(:each) do
    assign(:conferences, [
      stub_model(Conference,
        :presented_patients => ""
      ),
      stub_model(Conference,
        :presented_patients => ""
      )
    ])
  end

  it "renders a list of conferences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
