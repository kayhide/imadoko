require 'spec_helper'

describe "entries/index" do
  before(:each) do
    assign(:entries, [
      stub_model(Entry,
        :race => nil,
        :number => "Number",
        :status => "Status"
      ),
      stub_model(Entry,
        :race => nil,
        :number => "Number",
        :status => "Status"
      )
    ])
  end

  it "renders a list of entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
