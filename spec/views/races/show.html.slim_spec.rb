require 'spec_helper'

describe "races/show" do
  before(:each) do
    @race = assign(:race, stub_model(Race,
      :label => "Label",
      :url => "Url",
      :crawler => "Crawler",
      :distance => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Label/)
    rendered.should match(/Url/)
    rendered.should match(/Crawler/)
    rendered.should match(/1.5/)
  end
end
