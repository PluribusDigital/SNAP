require 'rails_helper'

RSpec.describe "retailers/show", :type => :view do
  before(:each) do
    @retailer = assign(:retailer, Retailer.create!(
      :name => "Name",
      :longitude => "Longitude",
      :latitude => "Latitude",
      :address1 => "Address1",
      :address2 => "Address2",
      :city => "City",
      :state => "State",
      :zip5 => "Zip5",
      :zip4 => "Zip4",
      :country => "Country"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Longitude/)
    expect(rendered).to match(/Latitude/)
    expect(rendered).to match(/Address1/)
    expect(rendered).to match(/Address2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip5/)
    expect(rendered).to match(/Zip4/)
    expect(rendered).to match(/Country/)
  end
end
