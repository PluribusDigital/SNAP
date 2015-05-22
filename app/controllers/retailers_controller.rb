class RetailersController < ApplicationController
  before_action :set_retailer, only: [:show]

  # GET /retailers
  # GET /retailers.json
  def index
    @retailers = Retailer.all.limit(10)
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
