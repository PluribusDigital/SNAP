require 'rails_helper'

RSpec.describe "Retailers", :type => :request do
  describe "GET /retailers" do
    it "works! (now write some real specs)" do
      get retailers_path
      expect(response.status).to be(200)
    end
  end
end
