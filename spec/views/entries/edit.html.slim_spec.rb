require 'spec_helper'

describe "entries/edit" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :race => nil,
      :number => "MyString",
      :status => "MyString"
    ))
  end

  it "renders the edit entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entry_path(@entry), "post" do
      assert_select "input#entry_race[name=?]", "entry[race]"
      assert_select "input#entry_number[name=?]", "entry[number]"
      assert_select "input#entry_status[name=?]", "entry[status]"
    end
  end
end
