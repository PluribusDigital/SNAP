require 'rails_helper'

RSpec.describe "retailers/edit", :type => :view do
  before(:each) do
    @retailer = assign(:retailer, Retailer.create!(
      :name => "MyString",
      :longitude => "MyString",
      :latitude => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip5 => "MyString",
      :zip4 => "MyString",
      :country => "MyString"
    ))
  end

  it "renders the edit retailer form" do
    render

    assert_select "form[action=?][method=?]", retailer_path(@retailer), "post" do

      assert_select "input#retailer_name[name=?]", "retailer[name]"

      assert_select "input#retailer_longitude[name=?]", "retailer[longitude]"

      assert_select "input#retailer_latitude[name=?]", "retailer[latitude]"

      assert_select "input#retailer_address1[name=?]", "retailer[address1]"

      assert_select "input#retailer_address2[name=?]", "retailer[address2]"

      assert_select "input#retailer_city[name=?]", "retailer[city]"

      assert_select "input#retailer_state[name=?]", "retailer[state]"

      assert_select "input#retailer_zip5[name=?]", "retailer[zip5]"

      assert_select "input#retailer_zip4[name=?]", "retailer[zip4]"

      assert_select "input#retailer_country[name=?]", "retailer[country]"
    end
  end
end
