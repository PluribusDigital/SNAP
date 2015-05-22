class RetailersController < ApplicationController
  before_action :set_retailer, only: [:show]

  # GET /retailers
  # GET /retailers.json
  def index
    if params[:lat] && params[:lng]
      location = Location.new(lat: params[:lat], lng: params[:lng])
    else
      location = current_location
    end
    @retailers = Retailer.within(5, origin: location).limit(10).all
  end

  # GET /retailers/1
  # GET /retailers/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retailer
      @retailer = Retailer.find(params[:id])
    end

end
