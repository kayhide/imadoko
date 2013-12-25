require 'spec_helper'

describe "races/edit" do
  before(:each) do
    @race = assign(:race, stub_model(Race,
      :label => "MyString",
      :url => "MyString",
      :crawler => "MyString",
      :distance => 1.5
    ))
  end

  it "renders the edit race form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", race_path(@race), "post" do
      assert_select "input#race_label[name=?]", "race[label]"
      assert_select "input#race_url[name=?]", "race[url]"
      assert_select "input#race_crawler[name=?]", "race[crawler]"
      assert_select "input#race_distance[name=?]", "race[distance]"
    end
  end
end
