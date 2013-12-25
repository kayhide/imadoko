require 'spec_helper'

describe "races/new" do
  before(:each) do
    assign(:race, stub_model(Race,
      :label => "MyString",
      :url => "MyString",
      :crawler => "MyString",
      :distance => 1.5
    ).as_new_record)
  end

  it "renders new race form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", races_path, "post" do
      assert_select "input#race_label[name=?]", "race[label]"
      assert_select "input#race_url[name=?]", "race[url]"
      assert_select "input#race_crawler[name=?]", "race[crawler]"
      assert_select "input#race_distance[name=?]", "race[distance]"
    end
  end
end
