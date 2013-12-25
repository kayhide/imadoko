require 'spec_helper'

describe "races/index" do
  before(:each) do
    assign(:races, [
      stub_model(Race,
        :label => "Label",
        :url => "Url",
        :crawler => "Crawler",
        :distance => 1.5
      ),
      stub_model(Race,
        :label => "Label",
        :url => "Url",
        :crawler => "Crawler",
        :distance => 1.5
      )
    ])
  end

  it "renders a list of races" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Crawler".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
