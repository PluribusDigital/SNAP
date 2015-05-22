require 'rails_helper'

RSpec.describe "retailers/index", :type => :view do
  before(:each) do
    assign(:retailers, [
      Retailer.create!(
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
      ),
      Retailer.create!(
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
      )
    ])
  end

  it "renders a list of retailers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Longitude".to_s, :count => 2
    assert_select "tr>td", :text => "Latitude".to_s, :count => 2
    assert_select "tr>td", :text => "Address1".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip5".to_s, :count => 2
    assert_select "tr>td", :text => "Zip4".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
  end
end
