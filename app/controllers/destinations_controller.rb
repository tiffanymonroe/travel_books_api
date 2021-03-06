class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show]
  #gets error if running this line of code:
  # before_action :authorize_user, except: [:index]


  # GET /destinations
  def index
    @destinations = Destination.all

    render json: @destinations
  end

  # GET /destinations/1
  def show
    render json: @destination
  end

  # POST /destinations
  def create
    @destination = Destination.new(destination_params)

    if @destination.save
      render json: @destination, status: :created, location: @destination
    else
      render json: @destination.errors, status: :unprocessable_entity
    end
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination
      @destination = Destination.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def destination_params
      params.require(:destination).permit(:name, :purpose, :transportation, :season, :climate, :user_id)
    end
end
