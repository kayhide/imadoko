require 'spec_helper'

describe "entries/new" do
  before(:each) do
    assign(:entry, stub_model(Entry,
      :race => nil,
      :number => "MyString",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entries_path, "post" do
      assert_select "input#entry_race[name=?]", "entry[race]"
      assert_select "input#entry_number[name=?]", "entry[number]"
      assert_select "input#entry_status[name=?]", "entry[status]"
    end
  end
end
