require 'spec_helper'

describe "programas/show.haml" do
  before(:each) do
    @programa = assign(:programa, stub_model(Programa,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end